enum PassType {
  day(
    name: "Day Pass",
    specialKeyWord: "Flexible",
    price: 5,
    duration: "24-hour",
  ),
  monthly(
    name: "Monthly Pass",
    specialKeyWord: "Most popular",
    price: 30,
    duration: "30-day",
  ),
  annual(
    name: "Annual Pass",
    specialKeyWord: "Best value",
    price: 125,
    duration: "365-day",
  );

  final String name;
  final String specialKeyWord;
  final double price;
  final String duration;

  const PassType({
    required this.name,
    required this.specialKeyWord,
    required this.price,
    required this.duration,
  });
}

class Subscription {
  final DateTime startDate;
  final PassType passType;
  final DateTime endDate;

  Subscription({
    required this.startDate,
    required this.passType,
  }) : endDate = switch (passType) {
    PassType.day => startDate.add(const Duration(days: 1)),
    PassType.monthly => DateTime(startDate.year, startDate.month + 1, startDate.day, startDate.hour, startDate.minute),
    PassType.annual => DateTime(startDate.year + 1, startDate.month, startDate.day, startDate.hour, startDate.minute),
  };
}