import 'package:flutter/material.dart';
import '../../../theme/theme.dart';
import '../../../widgets/display/custom_chip.dart';
import 'bike_item.dart';
import 'booking_detail.dart';

class StationDetail extends StatelessWidget {
  const StationDetail({super.key});


  void onUnlockBike(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BookingDetail()),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  Text("CADT", style: AppTextStyles.heading),
                  CustomChip(name: "Station 442")
                ],
              ),
              const SizedBox(height: 5),
              Text("Preak Leab, ChroyChangVa, Phnom Penh", style: AppTextStyles.body.copyWith(color: AppColors.subText)),
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
                          Text("5 availables", style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold, color: AppColors.subText)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
              Text("Available Bikes", style: AppTextStyles.title.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              BikeItem(onUnlock: () => onUnlockBike(context)),
              const SizedBox(height: 20),
              BikeItem(onUnlock: () => onUnlockBike(context)),
              const SizedBox(height: 20),
              BikeItem(onUnlock: () => onUnlockBike(context)),
              const SizedBox(height: 20),
              BikeItem(onUnlock: () => onUnlockBike(context))
            ],
          ),
        ),
      ),
    );
  }
}