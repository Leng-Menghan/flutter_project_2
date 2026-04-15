import 'package:flutter_project_2/data/repositories/stations/station_repository.dart';
import 'package:flutter_project_2/model/station/station.dart';

class StationRepositoryMock implements StationRepository{
  final List<Station> _stations = [
    Station(
      id: "104",
      name: "CADT",
      location: "Preaek Leap, Chroy Changvar, Phnom Penh",
    ),
    Station(
      id: "204",
      name: "Wat Phnom",
      location: "Wat Phnom, Daun Penh, Phnom Penh",
    ),
    Station(
      id: "304",
      name: "Phsar Thmey",
      location: "Phsar Thmey, Daun Penh, Phnom Penh",
    ),
    Station(
      id: "404",
      name: "RUPP",
      location: "Tuol Svay Prey, Tuol Kork, Phnom Penh",
    ),
    Station(
      id: "504",
      name: "Olympic Stadium",
      location: "Veal Vong, Prampir Makara, Phnom Penh",
    ),
  ];

  @override
  Future<List<Station>> fetchStations() {
    return Future.delayed(Duration(milliseconds: 100), () {
      return _stations;
    });
  }
}