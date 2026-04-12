
import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDate(DateTime dateTime) => DateFormat('dd MMMM yyyy | h:mm a').format(dateTime);
}