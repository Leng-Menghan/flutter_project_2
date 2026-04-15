class Booking {
  final String stationId;
  final String bikeId;
  final DateTime dateTime;
  final String paymentType;

  Booking({
    required this.stationId,
    required this.bikeId,
    required this.dateTime,
    required this.paymentType,
  });
}
