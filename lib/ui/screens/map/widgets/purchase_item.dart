import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class PurchaseItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final String description;
  const PurchaseItem({
    super.key,
    required this.icon,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.priBackground,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.chipBackground,
            ),
            child: Icon(icon, color: AppColors.label, size: 35),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3),
              Text(
                description,
                style: AppTextStyles.body.copyWith(color: AppColors.subText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
