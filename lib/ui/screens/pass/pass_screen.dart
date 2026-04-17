import 'package:flutter/material.dart';
import 'package:flutter_project_2/ui/screens/pass/view_model/pass_view_model.dart';
import 'package:flutter_project_2/ui/screens/pass/widgets/pass_content.dart';
import 'package:flutter_project_2/ui/states/subscription_state.dart';
import 'package:provider/provider.dart';

class PassScreen extends StatelessWidget {
  const PassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SubscriptionState subscriptionState = context.read<SubscriptionState>();

    return ChangeNotifierProvider(
      create: (_) => PassViewModel(subscriptionState: subscriptionState),
      builder:(context, child) {
        PassViewModel passViewModel = context.watch<PassViewModel>();
        return PassContent(passViewModel: passViewModel);
      },
    );
  }
}