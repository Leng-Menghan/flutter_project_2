import 'package:flutter/material.dart';
import '../../../theme/theme.dart';
import '../../../widgets/actions/custom_button.dart';
import '../../../widgets/display/custom_chip.dart';

class PassSubscription extends StatelessWidget {
  final String specialKeyWord;
  final String passType;
  final int price;
  final String duration;
  final VoidCallback onSubscribe;
  const PassSubscription({super.key, required this.specialKeyWord, required this.passType, required this.price, required this.duration, required this.onSubscribe});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.priBackground
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomChip(name: specialKeyWord.toUpperCase()),
                const SizedBox(height: 15),
                Text(passType, style: AppTextStyles.heading.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle_outline, color: AppColors.label, size: 25),
                    const SizedBox(width: 7),
                    Text("$duration total access duration", style: AppTextStyles.body.copyWith(color: AppColors.subText)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle_outline, color: AppColors.label, size: 25),
                    const SizedBox(width: 7),
                    Text("Unlimited bike rentals", style: AppTextStyles.body.copyWith(color: AppColors.subText)),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: CustomButton(name: "Subscribe", onPress: onSubscribe)
                )
              ],
            )
          ),
          Positioned(
            top: -130,
            right: -80,
            child: Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.chipBackground
                  ),
                ),
                Positioned(
                  right: 100,
                  bottom: 25,
                  child: Text("\$$price", style: AppTextStyles.title.copyWith(color: AppColors.label, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          )
        ]
      ),
    );
  }
}