import 'package:flutter_project_2/data/repositories/subscription/subscription_repository.dart';
import '../../../model/subscription/subscription.dart';


class SubscriptionRepositoryMock implements SubscriptionRepository{
  Subscription? _subscription;
  @override
  Future<Subscription?> fetchSubscription() {
    return Future.delayed(Duration(milliseconds: 100), () {
      if (_subscription == null) return null;

      if (_subscription!.endDate.isBefore(DateTime.now())) {
        return null;
      }

      return _subscription;
    });
  }

  @override
  Future<void> setSubscription(Subscription? subscription) async {
    _subscription = subscription;
  }
  
}