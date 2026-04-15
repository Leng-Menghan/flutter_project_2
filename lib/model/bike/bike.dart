enum Status { available, unavailable }

class Bike {
  final String id;
  Status status;
  final String stationId;
  Bike({required this.id, required this.status, required this.stationId});
}
