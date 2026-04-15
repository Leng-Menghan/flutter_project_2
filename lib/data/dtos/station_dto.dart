import 'package:flutter_project_2/model/station/station.dart';

class StationDto {
  static const String nameKey = "name";
  static const String locationKey = "location";

  static Station fromJson(String id, Map<String, dynamic> json) {
    assert(json[nameKey] is String);
    assert(json[locationKey] is String);

    return Station(id: id, name: json[nameKey], location: json[locationKey]);
  }

  /// Convert to JSON
  Map<String, dynamic> toJson(Station station) {
    return {nameKey: station.name, locationKey: station.location};
  }
}
