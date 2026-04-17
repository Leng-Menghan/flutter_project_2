import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../model/station/station.dart';
import '../../config/firebase_config.dart';
import '../../dtos/station_dto.dart';
import 'station_repository.dart';

class StationRepositoryFirebase implements StationRepository {
  @override
  Future<List<Station>> fetchStations() async {

    // 2. Otherwise fetch from API
    final Uri stationsUri = FirebaseConfig.baseUri.replace(path: "/stations.json");
    final http.Response response = await http.get(stationsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of stations
      Map<String, dynamic> staitonsJson = json.decode(response.body);

      List<Station> result = [];
      for (final entry in staitonsJson.entries) {
        result.add(StationDto.fromJson(entry.key, entry.value));
      }

      return result;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load stations');
    }
  }
}