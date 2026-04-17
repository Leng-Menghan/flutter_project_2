import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/bikes/bike_repository.dart';
import '../../../data/repositories/booking/booking_repository.dart';
import '../../../data/repositories/stations/station_repository.dart';
import '../../states/subscription_state.dart';
import 'view_model/profile_view_model.dart';
import 'widgets/profile_content.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StationRepository stationRepository = context.read<StationRepository>();
    BikeRepository bikeRepository = context.read<BikeRepository>();
    BookingRepository bookingRepository = context.read<BookingRepository>();
    SubscriptionState subscriptionState = context.watch<SubscriptionState>();

    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(
        bookingRepository: bookingRepository, 
        bikeRepository: bikeRepository, 
        stationRepository: stationRepository, 
        subscriptionState: subscriptionState
      ),
      builder: (context, child){
        ProfileViewModel profileViewModel = context.watch<ProfileViewModel>();
        return ProfileContent(profileViewModel: profileViewModel);
      },
    );
  }
}