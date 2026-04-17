import 'package:flutter/material.dart';
import '../../../../utils/date_time_utils.dart';
import '../../../theme/theme.dart';
import '../../../widgets/display/custom_chip.dart';
import '../view_model/booking_item_data.dart';

class BookedCard extends StatelessWidget {
  final BookingItemData booking;
  const BookedCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Stack(
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
                Row(
                  children: [
                    Icon(Icons.calendar_month, color: AppColors.label, size: 22,),
                    const SizedBox(width: 7),
                    Text(DateTimeUtils.formatDateTime(booking.dateTime), style: AppTextStyles.body),
                    const Spacer(),
                    CustomChip(name: booking.paymentType),
                  ],
                ),
                const Divider(
                  height: 30,
                ),
                CustomChip(name: "Station ${booking.station.id}"),
                const SizedBox(height: 15,),
                Text(booking.station.name, style: AppTextStyles.heading),
                Text(booking.station.location, style: AppTextStyles.body.copyWith(color: AppColors.subText)),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    Icon(Icons.pedal_bike, color: AppColors.label, size: 50),
                    const SizedBox(width: 20),
                    Text("SLOT ${booking.bike.id}", style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold, color: AppColors.subText)),
                  ],
                ),
              ],
            )
          )
        ]
      ),
    );
  }
}