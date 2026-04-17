import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../data/repositories/bikes/bike_repository.dart';
import '../../../../data/repositories/booking/booking_repository.dart';
import '../../../../data/repositories/coordinates/coordinate_repository.dart';
import '../../../../data/repositories/stations/station_repository.dart';
import '../../../../model/bike/bike.dart';
import '../../../../model/booking/booking.dart';
import '../../../../model/station/coordinate.dart';
import '../../../../model/station/station.dart';
import '../../../../model/subscription/subscription.dart';
import '../../../../utils/async_value.dart';
import '../../../states/subscription_state.dart';
import 'station_item_data.dart';

class MapViewModel extends ChangeNotifier{
  final StationRepository stationRepository;
  final CoordinateRepository coordinateRepository;
  final BikeRepository bikeRepository;
  final BookingRepository bookingRepository;
  final SubscriptionState subscriptionState;

  AsyncValue<List<StationItemData>> data = AsyncValue.loading();
  Subscription? get subscription => subscriptionState.subscription;

  MapViewModel({
    required this.stationRepository,
    required this.coordinateRepository,
    required this.bikeRepository, 
    required this.bookingRepository, 
    required this.subscriptionState
  }){
    _init();
    subscriptionState.loadSubscription();
    subscriptionState.addListener(notifyListeners);
  }

  @override
  void dispose() {
    subscriptionState.removeListener(notifyListeners);
    super.dispose();
  }

  void _init() async {
    fetchStations();
  }

  void fetchStations() async {
    data = AsyncValue.loading();
    notifyListeners();

    try {
      // 1- Fetch station
      List<Station> stations = await stationRepository.fetchStations();

      // 2- Fethc coordinate
      List<Coordinate> coordinates = await coordinateRepository.fetchCoordinates();

      // 2- Fethc bike  
      List<Bike> bikes = await bikeRepository.fetchBikes();

      List<StationItemData> data = stations.map((station) {
        List<Bike> available = bikes.where((b) => b.stationId == station.id && b.status == Status.available).toList();
        return StationItemData(
            coordinate: coordinates.firstWhere((c) => c.stationId == station.id), 
            station: station, 
            bikes: available, 
            availableBikes: available.length
          );
        }
      ).toList();

      this.data = AsyncValue.success(data);

    } catch (e) {
      // 3- Fetch is unsucessfull
      data = AsyncValue.error(e);
    }
    notifyListeners();
  }

  Future<void> updateBikeStatus(Bike bike) async {
    await bikeRepository.updateBikeStatus(bike);
    fetchStations(); 
  }

  void setBooking(Booking booking){
    bookingRepository.setBookings(booking);
  }
  
}