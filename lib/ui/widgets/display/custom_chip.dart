import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class CustomChip extends StatelessWidget {
  final String name;
  const CustomChip({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.chipBackground,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text(
        name.toUpperCase(), 
        style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold, color: AppColors.label),
      )
    );
  }
}