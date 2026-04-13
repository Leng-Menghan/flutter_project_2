import 'package:flutter/material.dart';
import '../../../theme/theme.dart';
import '../../../widgets/display/active_pass.dart';
import '../../../widgets/display/booking_card.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.priBackground,
        title: Row(
          children: [
            Icon(Icons.person, color: AppColors.label, size: 35,),
            const SizedBox(width: 15),
            Text("My Profile", style: AppTextStyles.title.copyWith(color: AppColors.label, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/images/image.png'),
                  ),
                  const SizedBox(width: 20,),
                  Text("Soeun Sokvipor", style: AppTextStyles.title.copyWith(color: AppColors.label, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color: AppColors.priBackground
                    ),
                    child: Icon(Icons.subscriptions, color: AppColors.label, size: 30,),
                  ),
                  const SizedBox(width: 15),
                  Text("Your Pass Subscription", style: AppTextStyles.label.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              ActivePass(passType:PassType.monthly, startDate: DateTime(2026, 3, 15)),
              const SizedBox(height: 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color: AppColors.priBackground
                    ),
                    child: Icon(Icons.history, color: AppColors.label, size: 30,),
                  ),
                  const SizedBox(width: 15),
                  Text("Booking History", style: AppTextStyles.label.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              BookingCard()
            ],
          ),
        ),
      ),
    );
  }
}