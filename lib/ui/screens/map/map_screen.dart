import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/bikes/bike_repository.dart';
import '../../../data/repositories/booking/booking_repository.dart';
import '../../../data/repositories/coordinates/coordinate_repository.dart';
import '../../../data/repositories/stations/station_repository.dart';
import '../../states/subscription_state.dart';
import 'view_model.dart/map_view_model.dart';
import 'widgets/map_content.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StationRepository stationRepository = context.read<StationRepository>();
    BikeRepository bikeRepository = context.read<BikeRepository>();
    CoordinateRepository coordinateRepository = context.read<CoordinateRepository>();
    BookingRepository bookingRepository = context.read<BookingRepository>();
    SubscriptionState? subscriptionState = context.watch<SubscriptionState>();

    return ChangeNotifierProvider(
      create: (context) => MapViewModel(
        stationRepository: stationRepository, 
        coordinateRepository: coordinateRepository, 
        bikeRepository: bikeRepository, 
        bookingRepository: bookingRepository,
        subscriptionState: subscriptionState
      ),
      builder: (context, child){
        MapViewModel mapViewModel = context.watch<MapViewModel>();
        return MapContent(mapViewModel: mapViewModel);
      },
    );
  }
}