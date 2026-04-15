import '../../../model/subscription/subscription.dart';

abstract class SubscriptionRepository {
  Future<Subscription?> fetchSubscription();
   Future<void> setSubscription(Subscription? subscription);
}