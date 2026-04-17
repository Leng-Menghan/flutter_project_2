import 'package:flutter/material.dart';
import '../../data/repositories/subscription/subscription_repository.dart';
import '../../model/subscription/subscription.dart';

class SubscriptionState extends ChangeNotifier{
  final SubscriptionRepository subscriptionRepository;

  SubscriptionState({
    required this.subscriptionRepository
  });

  Subscription? _subscription;
  Subscription? get subscription => _subscription;

  void setSubscription(Subscription subscription) async {
    bool isSuccess = await subscriptionRepository.setSubscription(subscription);
    if(isSuccess){
      _subscription = subscription;
      notifyListeners();
    }
  }

  void loadSubscription() async {
    _subscription = await subscriptionRepository.fetchSubscription();
    notifyListeners();
  }
}