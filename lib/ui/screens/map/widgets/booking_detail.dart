import 'package:flutter/material.dart';
import '../../../theme/theme.dart';
import '../../../widgets/display/booking_card.dart';
import '../../../widgets/display/inactive_pass.dart';
import 'purchase_item.dart';

class BookingDetail extends StatelessWidget {
  const BookingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.priBackground,
        title: Row(
          children: [
            Expanded(
              child: Text(
                "Booking Detail",
                textAlign: TextAlign.center,
                style: AppTextStyles.title.copyWith(
                  color: AppColors.label,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/image.png'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookingCard(),
              const SizedBox(height: 25),
              Text(
                "Your Active Pass",
                style: AppTextStyles.label.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // ActivePass(passType: PassType.day, startDate: DateTime.now()),
              InactivePass(),
              const SizedBox(height: 25),
              Text(
                "Purchase Options",
                style: AppTextStyles.label.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              PurchaseItem(
                icon: Icons.local_activity,
                name: "Buy Single Ticket",
                description: "\$2.50 per 30 minutes",
              ),
              const SizedBox(height: 20),
              PurchaseItem(
                icon: Icons.subscriptions_rounded,
                name: "Choose Subscription",
                description: "Day, monthly, annual pass",
              ),
              // const SizedBox(height: 25),
              // Center(
              //   child: CustomButton(name: "Confirm Booking", onPress: (){})
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
