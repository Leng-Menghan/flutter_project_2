import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDate(DateTime dateTime) => DateFormat('dd MMMM yyyy | h:mm a').format(dateTime);

  static String formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final targetDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final time = DateFormat('hh:mm a').format(dateTime);

    if (targetDate == today) {
      return 'Today, $time';
    } else if (targetDate == today.subtract(Duration(days: 1))) {
      return 'Yesterday, $time';
    } else {
      return DateFormat('E, d MMM hh:mm a').format(dateTime); 
    }
  }
}