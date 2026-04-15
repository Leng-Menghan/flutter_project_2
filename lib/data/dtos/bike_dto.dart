import 'package:flutter_project_2/model/bike/bike.dart';

class BikeDto {
  static const String statusKey = 'status';
  static const String stationIdKey = 'stationId';

  static Bike fromJson(String id, Map<String, dynamic> json) {
    assert(json[statusKey] is String);
    assert(json[stationIdKey] is String);

    return Bike(
      id: id,
      status: Status.values.firstWhere((s) => s.name == json[statusKey]),
      stationId: json[stationIdKey],
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson(Bike bike) {
    return {statusKey: bike.status.name, stationIdKey: bike.stationId};
  }
}
