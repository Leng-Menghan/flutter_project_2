import 'package:flutter_project_2/data/repositories/subscription/subscription_repository.dart';
import '../../../model/subscription/subscription.dart';


class SubscriptionRepositoryMock implements SubscriptionRepository{
  final List<Subscription> _subscriptions = [
    Subscription(startDate: DateTime(2026, 3, 5), passType: PassType.day),
    Subscription(startDate: DateTime(2026, 4, 5), passType: PassType.day),
    // Subscription(startDate: DateTime.now(), passType: PassType.day),
  ];
  @override
  Future<Subscription?> fetchSubscription() {
    return Future.delayed(Duration(milliseconds: 100), () {
      try {
        return _subscriptions.firstWhere((subscription) => !subscription.endDate.isBefore(DateTime.now()));
      } catch (e) {
        return null;
      }
    });
  }

  @override
  Future<bool> setSubscription(Subscription subscription) async {
    Subscription? activeSub = await fetchSubscription();

    if (activeSub != null) {
      print("Already has active pass");
      return false;
    }

    _subscriptions.add(subscription);
    return true;
  }
  
}