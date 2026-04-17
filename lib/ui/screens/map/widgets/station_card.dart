import 'package:flutter/material.dart';
import '../../../../model/bike/bike.dart';
import '../../../theme/theme.dart';
import '../../../widgets/display/custom_chip.dart';
import '../view_model.dart/station_item_data.dart';

class StationCard extends StatelessWidget {
  final StationItemData station;
  final Bike bike;
  const StationCard({super.key, required this.station, required this.bike});

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
              CustomChip(name: "Station ${station.station.id}"),
              const SizedBox(height: 15,),
              Text(station.station.name, style: AppTextStyles.heading),
              Text(station.station.location, style: AppTextStyles.body.copyWith(color: AppColors.subText)),
              const SizedBox(height: 15,),
              Row(
                children: [
                  Icon(Icons.pedal_bike, color: AppColors.label, size: 50),
                  const SizedBox(width: 20),
                  Text("SLOT ${bike.id}", style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold, color: AppColors.subText)),
                ],
              )
            ],
          )
        )
      ]
    );
  }
}