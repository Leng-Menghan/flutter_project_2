import 'package:flutter/material.dart';
import 'ui/widgets/actions/custom_button.dart';
import 'ui/widgets/display/active_pass.dart';
import 'ui/widgets/display/booking_card.dart';
import 'ui/widgets/display/custom_chip.dart';
import 'ui/widgets/display/inactive_pass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            ActivePass(passType: PassType.day, startDate: DateTime(2026, 4, 11),),
            const SizedBox(height: 20),
            CustomChip(name: "Station 442",),
            const SizedBox(height: 20),
            CustomButton(name: "Confirm Booking", onPress: () => {},),
            const SizedBox(height: 20),
            CustomButton(name: "Confirm Booking", onPress: () => {}, isBig: false,),
            const SizedBox(height: 20),
            InactivePass(),
            const SizedBox(height: 20),
            BookingCard(),
          ],
        ),
      )
    );
  }
}




