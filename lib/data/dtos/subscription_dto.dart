import '../../model/subscription/subscription.dart';

class SubscriptionDto {
  static const String startDateKey = 'startDate';
  static const String passTypeKey = 'passType';

  static Subscription fromJson(String id, Map<String, dynamic> json) {
    assert(json[startDateKey] is String);
    assert(json[passTypeKey] is String);

    return Subscription(
      startDate: DateTime.parse(json[startDateKey]),
      passType: PassType.values.firstWhere((p) => p.name == json[passTypeKey]),
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson(Subscription subscription) {
    return {
      startDateKey: subscription.startDate.toIso8601String(),
      passTypeKey: subscription.passType.name,
    };
  }
}
