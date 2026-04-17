import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../model/bike/bike.dart';
import '../../../theme/theme.dart';
import '../../../widgets/display/custom_chip.dart';
import '../view_model.dart/map_view_model.dart';
import '../view_model.dart/station_item_data.dart';
import 'bike_item.dart';
import 'booking_detail.dart';

class StationDetail extends StatelessWidget {
  final StationItemData station;
  const StationDetail({super.key, required this.station});

  String get availableBikes => "${station.availableBikes} available${station.availableBikes > 1 ? "" : "s"}";

  @override
  Widget build(BuildContext context) {
    MapViewModel mapViewModel = context.watch<MapViewModel>();
    
    void onUnlockBike(StationItemData station, Bike bike){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<MapViewModel>.value(
            value: mapViewModel,
            child: BookingDetail(station: station, bike: bike),
            ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.priBackground,
        title: Row(
          children: [
            Expanded(
              child: Text("Station Detail", textAlign: TextAlign.center, style: AppTextStyles.title.copyWith(color: AppColors.label, fontWeight: FontWeight.bold))
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/image.png'),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(station.station.name, style: AppTextStyles.heading),
                  CustomChip(name: "Station ${station.station.id}")
                ],
              ),
              const SizedBox(height: 5),
              Text(station.station.location, style: AppTextStyles.body.copyWith(color: AppColors.subText)),
              const SizedBox(height: 25),
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/images/bike_station.png"),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Positioned(
                    left: 15,
                    bottom: 15,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.pedal_bike, color: AppColors.label, size: 30,),
                          const SizedBox(width: 10),
                          Text(availableBikes, style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold, color: AppColors.subText)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
              Text("Available Bikes", style: AppTextStyles.title.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ...station.bikes.map((bike) => BikeItem(onUnlock: (bike) => onUnlockBike(station, bike), bike: bike))
            ],
          ),
        ),
      ),
    );
  }
}