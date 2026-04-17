import 'package:flutter/material.dart';
import '../../../../model/bike/bike.dart';
import '../../../theme/theme.dart';
import '../../../widgets/actions/custom_button.dart';

class BikeItem extends StatelessWidget {
  final ValueChanged<Bike> onUnlock;
  final Bike bike;
  const BikeItem({super.key, required this.onUnlock, required this.bike});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
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
          Text("SLOT ${bike.id}", style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold, color: AppColors.subText)),
          const Spacer(),
          CustomButton(name: "Unlock Bike", onPress: () => onUnlock(bike), isBig: false,)
        ],
      ),
    );
  }
}