import 'package:flutter_project_2/model/station/coordinate.dart';

abstract class CoordinateRepository {
  Future<List<Coordinate>> fetchCoordinates();
}