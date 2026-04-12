import 'package:flutter/material.dart';
import '../../../utils/date_time_utils.dart';
import '../../theme/theme.dart';

enum PassType{
  day, monthly, annual
}
class ActivePass extends StatelessWidget {
  final PassType passType;
  final DateTime startDate;
  const ActivePass({super.key, required this.passType, required this.startDate});

  DateTime get endDate {
    DateTime end = switch (passType) {
      PassType.day => startDate.add(Duration(days: 1)),
      PassType.monthly => DateTime(
          startDate.year,
          startDate.month + 1,
          startDate.day,
          startDate.hour,
          startDate.minute,
        ),
      PassType.annual => DateTime(
          startDate.year + 1,
          startDate.month,
          startDate.day,
          startDate.hour,
          startDate.minute,
        ),
    };
    return end;
  }

  String passName(PassType type) => switch (type) {
    PassType.day => "Day Pass",
    PassType.monthly => "Monthly Pass",
    PassType.annual => "Annual Pass",
  };

  double get value {
    DateTime now = DateTime.now(); 
    int totalDuration = endDate.difference(startDate).inSeconds; 
    int completed = now.difference(startDate).inSeconds; 

    double progress = completed / totalDuration;
    return progress;
  }

  String get remainingTime {
    Duration diff = endDate.difference(DateTime.now());

    int months = diff.inDays ~/ 30; 
    int days = diff.inDays % 30;
    int hours = diff.inHours % 24;
    int minutes = diff.inMinutes % 60;

    if (months > 0) return "$months month${months > 1 ? 's' : ''} ${days}d";
    if (days > 0) return "${days}d ${hours}h";
    if (hours > 0) return "${hours}h ${minutes}m";
    return "${minutes}m";
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.border,
          width: 3
        )
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(passName(passType), style: AppTextStyles.heading),
              Icon(Icons.verified_outlined, color: AppColors.label, size: 35,)
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(Icons.check_circle_outline, color: AppColors.label, size: 22,),
              const SizedBox(width: 7),
              Text("Start Date: ${DateTimeUtils.formatDate(startDate)}", style: AppTextStyles.body,),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(Icons.check_circle_outline, color: AppColors.label, size: 22,),
              const SizedBox(width: 7),
              Text("Expired Date: ${DateTimeUtils.formatDate(endDate)}", style: AppTextStyles.body,),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Time Remaining", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Text("Expires in $remainingTime", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 15),
          LinearProgressIndicator(
            minHeight: 10,
            borderRadius: BorderRadius.circular(10),
            value: value,
            backgroundColor: Colors.green.shade100,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.label),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 22,),
              const SizedBox(width: 7),
              Text("Only one active pass at a time", style: AppTextStyles.body),
            ],
          ),
        ],
      ),
    );
  }
}