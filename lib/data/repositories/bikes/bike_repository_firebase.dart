import 'dart:convert';
import 'package:flutter_project_2/data/dtos/bike_dto.dart';
import 'package:flutter_project_2/data/repositories/bikes/bike_repository.dart';
import 'package:flutter_project_2/model/bike/bike.dart';
import 'package:http/http.dart' as http;
import '../../config/firebase_config.dart';

class BikeRepositoryFirebase implements BikeRepository {
  @override
  Future<List<Bike>> fetchBikes() async {
    // 2. Otherwise fetch from API
    final Uri bikesUriGet = FirebaseConfig.baseUri.replace(path: "/bikes.json");
    final http.Response response = await http.get(bikesUriGet);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of bikes
      Map<String, dynamic> bikesJson = json.decode(response.body);

      List<Bike> result = [];
      for (final entry in bikesJson.entries) {
        result.add(BikeDto.fromJson(entry.key, entry.value));
      }
      return result;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load bikes');
    }
  }

  @override
  Future<void> updateBikeStatus(Bike bike) async {
    final Uri bikesUriUpdate = FirebaseConfig.baseUri.replace(path: "/bikes/${bike.id}.json");
    final http.Response response = await http.patch(
      bikesUriUpdate,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"status": "unavailable"}),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to like song");
    }
  }
}