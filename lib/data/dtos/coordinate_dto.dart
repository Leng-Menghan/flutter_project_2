import 'package:flutter_project_2/model/station/coordinate.dart';

class CoordinateDto {
  static const String stationIdKey = 'stationId';
  static const String longitudeKey = "longitude";
  static const String latitudeKey = "latitude";

  static Coordinate fromJson(Map<String, dynamic> json) {
    assert(json[stationIdKey] is String);
    assert(json[longitudeKey] is double);
    assert(json[latitudeKey] is double);

    return Coordinate(
      stationId: json[stationIdKey],
      latitude: json[latitudeKey],
      longitude: json[longitudeKey],
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson(Coordinate coordinate) {
    return {
      stationIdKey: coordinate.stationId,
      longitudeKey: coordinate.longitude,
      latitudeKey: coordinate.latitude,
    };
  }
}
