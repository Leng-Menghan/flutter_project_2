import 'package:flutter_project_2/data/repositories/coordinates/coordinate_repository.dart';
import 'package:flutter_project_2/model/station/coordinate.dart';

class CoordinateRepositoryMock implements CoordinateRepository{
  final List<Coordinate> _coordinates = [
    Coordinate(
      stationId: "104",
      latitude: 11.6530569,  
      longitude: 104.9068069
    ),
    Coordinate(
      stationId: "204",
      latitude: 11.575989,   
      longitude: 104.922442
    ),
    Coordinate(
      stationId: "304",
      latitude:11.569395, 
      longitude:104.920362
    ),
    Coordinate(
      stationId: "404",
      latitude:11.567669, 
      longitude:104.890889
    ),
    Coordinate(
      stationId: "504",
      latitude:11.557548, 
      longitude:104.908559
    )
  ];
  @override
  Future<List<Coordinate>> fetchCoordinates() async {
    return Future.delayed(Duration(milliseconds: 100), () {
      return _coordinates;
    });
  }
}