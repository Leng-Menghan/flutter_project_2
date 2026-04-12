import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class InactivePass extends StatelessWidget {
  const InactivePass({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.priBackground
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("No Active Pass", style: AppTextStyles.label.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text("Only one active pass at a time.", style: AppTextStyles.body.copyWith(color: Colors.red)),
            ],
          ),
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 234, 174, 194),
            radius: 25,
            child: Icon(Icons.error_outline, color: Colors.red, size: 35,),
          )
        ],
      ),
    );
  }
}