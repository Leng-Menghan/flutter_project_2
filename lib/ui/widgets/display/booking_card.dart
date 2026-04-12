import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import 'custom_chip.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset('assets/images/bike.png', width: 250,)
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.priBackground
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomChip(name: "Station 422"),
              const SizedBox(height: 15,),
              Text("CADT", style: AppTextStyles.heading),
              Text("Preak Leab, ChroyChangVa, Phnom Penh", style: AppTextStyles.body.copyWith(color: AppColors.subText)),
              const SizedBox(height: 15,),
              Row(
                children: [
                  Icon(Icons.pedal_bike, color: AppColors.label, size: 50),
                  const SizedBox(width: 20),
                  Text("SLOT 01", style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold, color: AppColors.subText)),
                ],
              )
            ],
          )
        )
      ]
    );
  }
}