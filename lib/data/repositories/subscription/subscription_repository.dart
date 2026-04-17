import '../../../model/subscription/subscription.dart';

abstract class SubscriptionRepository {
  Future<Subscription?> fetchSubscription();
  Future<bool> setSubscription(Subscription subscription);
}