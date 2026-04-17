import 'package:flutter/material.dart';
import '../../../../model/subscription/subscription.dart';
import '../../../states/subscription_state.dart';

class PassViewModel extends ChangeNotifier {
  final SubscriptionState subscriptionState;
  
  Subscription? get subscription => subscriptionState.subscription;

  PassViewModel({
    required this.subscriptionState
  }){
    subscriptionState.loadSubscription();
    subscriptionState.addListener(notifyListeners);
  }

  @override
  void dispose() {
    subscriptionState.removeListener(notifyListeners);
    super.dispose();
  }

  void setSubscription(Subscription subscription){
    subscriptionState.setSubscription(subscription);
  }
}