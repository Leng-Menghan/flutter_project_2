import 'package:flutter/material.dart';
import 'package:flutter_project_2/ui/states/subscription_state.dart';
import '../../../../data/repositories/bikes/bike_repository.dart';
import '../../../../data/repositories/booking/booking_repository.dart';
import '../../../../data/repositories/stations/station_repository.dart';
import '../../../../model/bike/bike.dart';
import '../../../../model/booking/booking.dart';
import '../../../../model/station/station.dart';
import '../../../../model/subscription/subscription.dart';
import '../../../../utils/async_value.dart';
import 'booking_item_data.dart';

class ProfileViewModel extends ChangeNotifier {
  final BookingRepository bookingRepository;
  final BikeRepository bikeRepository;
  final StationRepository stationRepository;
  final SubscriptionState subscriptionState;

  ProfileViewModel({
    required this.bookingRepository, 
    required this.bikeRepository, 
    required this.stationRepository,
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

  AsyncValue<List<BookingItemData>> data = AsyncValue.loading();
  Subscription? get subscription => subscriptionState.subscription;

  void _init() async {
    fetchBookings();
  }

  void fetchBookings() async {
    data = AsyncValue.loading();
    notifyListeners();

    try {
      // 1- Fetch Booking
      List<Booking> bookings = await bookingRepository.fetchBookings();

      // 2- Fetch bike  
      List<Bike> bikes = await bikeRepository.fetchBikes();

      // 2- Fetch Station  
      List<Station> stations = await stationRepository.fetchStations();
      
      List<BookingItemData> data = bookings.map((booking) {
        Station station = stations.firstWhere((station) => station.id == booking.stationId);
        Bike bike = bikes.firstWhere((bike) => bike.id == booking.bikeId);
        return BookingItemData(
            station: station, 
            bike: bike, 
            dateTime: booking.dateTime, 
            paymentType: booking.paymentType
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
}