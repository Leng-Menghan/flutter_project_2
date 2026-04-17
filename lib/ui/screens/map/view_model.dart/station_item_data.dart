import '../../../../model/bike/bike.dart';
import '../../../../model/station/coordinate.dart';
import '../../../../model/station/station.dart';

class StationItemData {
  final Coordinate coordinate;
  final Station station;
  final List<Bike> bikes;
  final int availableBikes;

  StationItemData({
    required this.coordinate,
    required this.station,
    required this.bikes,
    required this.availableBikes
  });
}