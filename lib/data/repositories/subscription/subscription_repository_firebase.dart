import 'dart:convert';
import 'package:flutter_project_2/data/dtos/subscription_dto.dart';
import 'package:http/http.dart' as http;
import '../../../model/subscription/subscription.dart';
import '../../config/firebase_config.dart';
import 'subscription_repository.dart';

class SubscriptionRepositoryFirebase implements SubscriptionRepository {
  @override
  Future<Subscription?> fetchSubscription() async {
    final Uri subscriptionsUriGet = FirebaseConfig.baseUri.replace(path: "/subscriptions.json");
    final http.Response response = await http.get(subscriptionsUriGet);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of subscriptions
      if (response.body == "null") return null;

      Map<String, dynamic>? subscriptionsJson = json.decode(response.body);

      List<Subscription> result = [];
      for (final entry in subscriptionsJson!.entries) {
        result.add(SubscriptionDto.fromJson(entry.value));
      }

      try {
        return result.firstWhere((subscription) => !subscription.endDate.isBefore(DateTime.now()));
      } catch (e) {
        return null;
      }

    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load subscription');
    }
  }
  
  @override
  Future<bool> setSubscription(Subscription subscription) async {
    Subscription? activeSub = await fetchSubscription();

    if (activeSub != null) {
      print("Already exist active pass");
      return false;
    }

    final Uri subscriptionUriPost = FirebaseConfig.baseUri.replace(path: "/subscriptions.json");
    final response = await http.post(
      subscriptionUriPost,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(SubscriptionDto.toJson(subscription)),
    );
    if (response.statusCode != 200) {
        throw Exception("Failed to add subscription");
    }
    return true;
  }
}