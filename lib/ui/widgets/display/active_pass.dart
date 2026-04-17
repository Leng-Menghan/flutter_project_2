import 'package:flutter/material.dart';
import '../../../model/subscription/subscription.dart';
import '../../../utils/date_time_utils.dart';
import '../../theme/theme.dart';

class ActivePass extends StatelessWidget {
  final Subscription subscription;
  const ActivePass({super.key, required this.subscription});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.border,
          width: 3
        )
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(subscription.passType.name, style: AppTextStyles.heading),
              Icon(Icons.verified_outlined, color: AppColors.label, size: 35,)
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(Icons.check_circle_outline, color: AppColors.label, size: 22,),
              const SizedBox(width: 7),
              Text("Start Date: ${DateTimeUtils.formatDate(subscription.startDate)}", style: AppTextStyles.body,),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(Icons.check_circle_outline, color: AppColors.label, size: 22,),
              const SizedBox(width: 7),
              Text("Expired Date: ${DateTimeUtils.formatDate(subscription.endDate)}", style: AppTextStyles.body,),
            ],
          ),

          const Divider(height: 30,),
          Row(
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 22,),
              const SizedBox(width: 7),
              Text("Only one active pass at a time", style: AppTextStyles.body),
            ],
          ),
        ],
      ),
    );
  }
}