import 'package:flutter/material.dart';
import '../../../../model/subscription/subscription.dart';
import '../../../../utils/async_value.dart';
import '../../../theme/theme.dart';
import '../../../widgets/display/active_pass.dart';
import '../../../widgets/display/inactive_pass.dart';
import '../view_model/booking_item_data.dart';
import '../view_model/profile_view_model.dart';
import 'booked_card.dart';

class ProfileContent extends StatelessWidget {
  final ProfileViewModel profileViewModel;
  const ProfileContent({super.key, required this.profileViewModel});

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<BookingItemData>> asyncValue = profileViewModel.data;

    Widget content;
    switch (asyncValue.state) {
      case AsyncValueState.loading:
        content = Center(child: CircularProgressIndicator());
        break;
      case AsyncValueState.error:
        content = Center(child: Text('error = ${asyncValue.error!}', style: TextStyle(color: Colors.red),));
        break;
      case AsyncValueState.success:
        List<BookingItemData> data = asyncValue.data!;
        content = data.isEmpty ? 
          Center(
            // child: Text("None", style: AppTextStyles.label.copyWith(fontWeight: FontWeight.bold, color: Colors.red))
            child: Image.asset('assets/images/empty.png', height: 100, width: 100,),
          ) : 
          Column(
            children: [
              ...data.reversed.map((booking) => BookedCard(booking: booking))
            ],
          );
    }

    
    Subscription? subscription = profileViewModel.subscription;

    Widget content1;
    if(subscription == null){
      content1 = InactivePass();
    }else{
      content1 = ActivePass(subscription: subscription);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.priBackground,
        title: Row(
          children: [
            Icon(Icons.person, color: AppColors.label, size: 35,),
            const SizedBox(width: 15),
            Text("My Profile", style: AppTextStyles.title.copyWith(color: AppColors.label, fontWeight: FontWeight.bold)),
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
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/images/image.png'),
                  ),
                  const SizedBox(width: 20,),
                  Text("Soeun Sokvipor", style: AppTextStyles.title.copyWith(color: AppColors.label, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color: AppColors.priBackground
                    ),
                    child: Icon(Icons.subscriptions, color: AppColors.label, size: 30,),
                  ),
                  const SizedBox(width: 15),
                  Text("Your Pass Subscription", style: AppTextStyles.label.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              content1,
              const SizedBox(height: 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color: AppColors.priBackground
                    ),
                    child: Icon(Icons.history, color: AppColors.label, size: 30,),
                  ),
                  const SizedBox(width: 15),
                  Text("Booking History", style: AppTextStyles.label.copyWith(fontWeight: FontWeight.bold)),
                ],
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