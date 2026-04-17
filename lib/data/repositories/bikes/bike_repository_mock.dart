import 'package:flutter_project_2/data/repositories/bikes/bike_repository.dart';
import 'package:flutter_project_2/model/bike/bike.dart';

class BikeRepositoryMock implements BikeRepository{
  final List<Bike> _bikes = [
    // 🟢 Station 104 (3 bikes)
    Bike(id: "01", status: Status.available, stationId: "104"),
    Bike(id: "02", status: Status.available, stationId: "104"),
    Bike(id: "03", status: Status.unavailable, stationId: "104"),

    // 🟢 Station 204 (4 bikes)
    Bike(id: "04", status: Status.available, stationId: "204"),
    Bike(id: "05", status: Status.available, stationId: "204"),
    Bike(id: "06", status: Status.unavailable, stationId: "204"),
    Bike(id: "07", status: Status.available, stationId: "204"),

    // 🟢 Station 304 (5 bikes)
    Bike(id: "08", status: Status.available, stationId: "304"),
    Bike(id: "09", status: Status.available, stationId: "304"),
    Bike(id: "10", status: Status.unavailable, stationId: "304"),
    Bike(id: "11", status: Status.available, stationId: "304"),
    Bike(id: "12", status: Status.available, stationId: "304"),

    // 🟢 Station 404 (4 bikes)
    Bike(id: "13", status: Status.available, stationId: "404"),
    Bike(id: "14", status: Status.available, stationId: "404"),
    Bike(id: "15", status: Status.unavailable, stationId: "404"),
    Bike(id: "16", status: Status.available, stationId: "404"),

    // 🟢 Station 504 (3 bikes)
    Bike(id: "17", status: Status.available, stationId: "504"),
    Bike(id: "18", status: Status.available, stationId: "504"),
    Bike(id: "19", status: Status.unavailable, stationId: "504"),
  ];

  @override
  Future<List<Bike>> fetchBikes() {
    return Future.delayed(Duration(milliseconds: 100), () {
      return _bikes;
    });
  }

  @override
  Future<void> updateBikeStatus(Bike bike) async {
    bike.status = Status.unavailable;
  }
  
}