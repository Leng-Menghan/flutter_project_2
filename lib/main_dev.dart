import 'package:provider/provider.dart';
import 'data/repositories/bikes/bike_repository.dart';
import 'data/repositories/bikes/bike_repository_mock.dart';
import 'data/repositories/booking/booking_repository.dart';
import 'data/repositories/booking/booking_repository_mock.dart';
import 'data/repositories/coordinates/coordinate_repository.dart';
import 'data/repositories/coordinates/coordinate_repository_mock.dart';
import 'data/repositories/stations/station_repository.dart';
import 'data/repositories/stations/station_repository_mock.dart';
import 'data/repositories/subscription/subscription_repository.dart';
import 'data/repositories/subscription/subscription_repository_mock.dart';
import 'main_common.dart';
import 'ui/states/subscription_state.dart';

List<InheritedProvider> get devProviders {
  SubscriptionRepository subscriptionRepository = SubscriptionRepositoryMock();
  return [
    // 1 - Inject the bike repository
    Provider<BikeRepository>(create: (_) => BikeRepositoryMock()),

    // 2 - Inject the coordinate repository
    Provider<CoordinateRepository>(create: (_) => CoordinateRepositoryMock()),

    // 3 - Inject the station repository
    Provider<StationRepository>(create: (_) => StationRepositoryMock()),

    // 4 - Inject the subscription repository
    ChangeNotifierProvider<SubscriptionState>(create: (_) => SubscriptionState(subscriptionRepository: subscriptionRepository)),

    // 5 - Inject the booking repository
    Provider<BookingRepository>(create: (_) => BookingRepositoryMock()),
  ];
}

void main() {
  mainCommon(devProviders);
}