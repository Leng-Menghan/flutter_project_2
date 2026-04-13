import 'package:flutter/material.dart';
import '../../../theme/theme.dart';
import '../../../widgets/display/inactive_pass.dart';
import 'pass_subscription.dart';

class PassContent extends StatelessWidget {
  const PassContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.priBackground,
        title: Row(
          children: [
            Icon(Icons.subscriptions, color: AppColors.label, size: 35,),
            const SizedBox(width: 15),
            Text("Pass Selection", style: AppTextStyles.title.copyWith(color: AppColors.label, fontWeight: FontWeight.bold)),
            const Spacer(),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/image.png'),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InactivePass(),
              const SizedBox(height: 25),
              Text("Select your journey", style: AppTextStyles.title.copyWith(fontWeight: FontWeight.bold)),
              Text("Choose a subscription plan that you prefered", style: AppTextStyles.body.copyWith(color: AppColors.subText)),
              const SizedBox(height: 25),
              PassSubscription(
                specialKeyWord: "flexible", 
                passType: "Day Pass", 
                price: 5, 
                duration: "24-hour", 
                onSubscribe: () {}
              ),
              const SizedBox(height: 20),
              PassSubscription(
                specialKeyWord: "MOST POPULAR", 
                passType: "Monthly Pass", 
                price: 30, 
                duration: "30-day", 
                onSubscribe: () {}
              ),
              const SizedBox(height: 20),
              PassSubscription(
                specialKeyWord: "best value", 
                passType: "Annual Pass", 
                price: 125, 
                duration: "365-day", 
                onSubscribe: () {}
              ),
            ],
          ),
        ),
      ),
    );
  }
}