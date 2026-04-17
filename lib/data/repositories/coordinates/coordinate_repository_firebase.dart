import 'dart:convert';
import 'package:flutter_project_2/data/dtos/coordinate_dto.dart';
import 'package:http/http.dart' as http;

import '../../../model/station/coordinate.dart';
import '../../config/firebase_config.dart';
import 'coordinate_repository.dart';

class CoordinateRepositoryFirebase implements CoordinateRepository {

  @override
  Future<List<Coordinate>> fetchCoordinates() async {

    // 2. Otherwise fetch from API
    final Uri coordinatesUri = FirebaseConfig.baseUri.replace(path: "/coordinates.json");
    final http.Response response = await http.get(coordinatesUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of coordinates
      List<dynamic> coordinatesJson = json.decode(response.body);
      List<Coordinate> result = [];
      for (final item in coordinatesJson) {
        result.add(CoordinateDto.fromJson(item));
      }

      return result;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load bikes');
    }
  }
}