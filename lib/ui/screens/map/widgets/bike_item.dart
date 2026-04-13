import 'package:flutter/material.dart';
import '../../../theme/theme.dart';
import '../../../widgets/actions/custom_button.dart';

class BikeItem extends StatelessWidget {
  final VoidCallback onUnlock;
  const BikeItem({super.key, required this.onUnlock});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.priBackground
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.pedal_bike, color: AppColors.label, size: 50,),
          const SizedBox(width: 20),
          Text("SLOT 01", style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold, color: AppColors.subText)),
          const Spacer(),
          CustomButton(name: "Unlock Bike", onPress: onUnlock, isBig: false,)
        ],
      ),
    );
  }
}