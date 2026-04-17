import 'package:flutter_project_2/model/booking/booking.dart';

class BookingDto {
  static const String bikeIdKey = 'bikeId';
  static const String stationIdKey = 'stationId';
  static const String dateTimeKey = "dateTime";
  static const String paymentTypeKey = "paymentType";

  static Booking fromJson(Map<String, dynamic> json) {
    assert(json[bikeIdKey] is String);
    assert(json[stationIdKey] is String);
    assert(json[dateTimeKey] is String);
    assert(json[paymentTypeKey] is String);

    return Booking(
      stationId: json[stationIdKey],
      bikeId: json[bikeIdKey],
      dateTime: DateTime.parse(json[dateTimeKey]),
      paymentType: json[paymentTypeKey],
    );
  }

  /// Convert to JSON
  static Map<String, dynamic> toJson(Booking booking) {
    return {
      stationIdKey: booking.stationId,
      bikeIdKey: booking.bikeId,
      dateTimeKey: booking.dateTime.toIso8601String(),
      paymentTypeKey: booking.paymentType,
    };
  }
}
