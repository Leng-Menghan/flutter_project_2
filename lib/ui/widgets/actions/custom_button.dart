import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final String name;
  final bool isBig;
  const CustomButton({super.key, required this.name, required this.onPress, this.isBig = true});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonBackground,
        padding: isBig ? EdgeInsets.symmetric(vertical: 10, horizontal: 50) : EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        minimumSize: Size(0, 0)
      ),
      onPressed: onPress, 
      child: Text(
        name, 
        style: AppTextStyles.body.copyWith(color: Colors.white, fontWeight: isBig ? FontWeight.bold : FontWeight.normal),
      )
    );
  }
}