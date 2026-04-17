import '../../../../model/bike/bike.dart';
import '../../../../model/station/station.dart';

class BookingItemData {
  final Station station;
  final Bike bike;
  final DateTime dateTime;
  final String paymentType;

  BookingItemData({
    required this.station,
    required this.bike,
    required this.dateTime,
    required this.paymentType
  });
}