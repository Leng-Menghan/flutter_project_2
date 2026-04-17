import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../model/bike/bike.dart';
import '../../../../model/booking/booking.dart';
import '../../../../model/subscription/subscription.dart';
import '../../../theme/theme.dart';
import '../../../widgets/actions/custom_button.dart';
import '../../../widgets/display/active_pass.dart';
import '../../../widgets/display/inactive_pass.dart';
import '../../pass/pass_screen.dart';
import '../view_model.dart/map_view_model.dart';
import '../view_model.dart/station_item_data.dart';
import 'purchase_item.dart';
import 'station_card.dart';

class BookingDetail extends StatelessWidget {
  final StationItemData station;
  final Bike bike;
  const BookingDetail({super.key, required this.station, required this.bike});

  @override
  Widget build(BuildContext context) {
    MapViewModel mapViewModel = context.watch<MapViewModel>();
    Subscription? subscription = mapViewModel.subscription;

    void onTapPurchase(String purchaseType) async {
      Booking newBooking = Booking(stationId: station.station.id, bikeId: bike.id, dateTime: DateTime.now(), paymentType: purchaseType);

      mapViewModel.setBooking(newBooking);
      mapViewModel.updateBikeStatus(bike);

      Navigator.pop(context);
      Navigator.pop(context);
    }

    Widget content;
    if(subscription == null){
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InactivePass(),
          const SizedBox(height: 25),
          Text(
            "Purchase Options",
            style: AppTextStyles.label.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          PurchaseItem(
            icon: Icons.local_activity,
            name: "Buy Single Ticket",
            description: "\$2.50 per 30 minutes",
            onTap: () => onTapPurchase("Ticket")
          ),
          const SizedBox(height: 20),
          PurchaseItem(
            icon: Icons.subscriptions_rounded,
            name: "Choose Subscription",
            description: "Day, monthly, annual pass",
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PassScreen()),
            )
          ),
        ],
      );
    }else{
      content = Column(
        children: [
          ActivePass(subscription: subscription),
          const SizedBox(height: 25),
          Center(
            child: CustomButton(
              name: "Confirm Booking", 
              onPress: () => onTapPurchase(subscription.passType.name)
            )
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.priBackground,
        title: Row(
          children: [
            Expanded(
              child: Text(
                "Booking Detail",
                textAlign: TextAlign.center,
                style: AppTextStyles.title.copyWith(
                  color: AppColors.label,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/image.png'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StationCard(station: station, bike: bike),
              const SizedBox(height: 25),
              Text(
                "Your Active Pass",
                style: AppTextStyles.label.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              content
            ],
          ),
        ),
      ),
    );
  }
}
