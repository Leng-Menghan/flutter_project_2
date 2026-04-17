import 'package:flutter/material.dart';
import '../../../../model/subscription/subscription.dart';
import '../../../theme/theme.dart';
import '../../../widgets/display/active_pass.dart';
import '../../../widgets/display/inactive_pass.dart';
import '../view_model/pass_view_model.dart';
import 'pass_subscription.dart';

class PassContent extends StatelessWidget {
  final PassViewModel passViewModel;
  const PassContent({super.key, required this.passViewModel});

  @override
  Widget build(BuildContext context) {
    void onSubscribe(PassType passType){
      Subscription subscription = Subscription(startDate: DateTime.now(), passType: passType);
      passViewModel.setSubscription(subscription);
    }

    Subscription? subscription = passViewModel.subscription;
    Widget content = subscription == null ? InactivePass() : ActivePass(subscription: subscription);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.priBackground,
        title: Row(
          children: [
            Icon(Icons.subscriptions, color: AppColors.label, size: 35,),
            const SizedBox(width: 15),
            Text("Pass Selection", style: AppTextStyles.title.copyWith(color: AppColors.label, fontWeight: FontWeight.bold)),
            const Spacer(),
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
              content,
              const SizedBox(height: 25),
              Text("Select your journey", style: AppTextStyles.title.copyWith(fontWeight: FontWeight.bold)),
              Text("Choose a subscription plan that you prefered", style: AppTextStyles.body.copyWith(color: AppColors.subText)),
              const SizedBox(height: 25),
              ...PassType.values.map((pt) {
                  return PassSubscription(passType: pt, onSubscribe: () => onSubscribe(pt));
              })
            ],
          ),
        ),
      ),
    );
  }
}