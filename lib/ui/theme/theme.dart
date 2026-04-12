import 'package:flutter/material.dart';
 
///
/// Definition of App colors.
///
class AppColors {

  // Bellow colors never changes with theme :
  static Color darkGreen = const Color(0xFF006B1B);
  static Color lightGreen = const Color(0xFF91F78E);
  static Color lighterGreen = const Color.fromARGB(255, 216, 234, 220);

  static Color darkGrey = const Color(0xFF777676);
  static Color lightGrey = const Color(0xFFAEADAC);

  static Color background = const Color(0XFFF3F0F0);

  static Color get label {
    return AppColors.darkGreen;
  }

  static Color get subLabel {
    return AppColors.lightGreen;
  }

  static Color get subText {
    return AppColors.darkGrey;
  }

  static Color get disabled {
    return AppColors.lightGrey;
  }

  static Color get priBackground {
    return AppColors.background;
  }

  static Color get chipBackground {
    return AppColors.lighterGreen;
  }

  static Color get border {
    return AppColors.lighterGreen;
  }

  static Color get buttonBackground {
    return AppColors.darkGreen;
  }
}

///
/// Definition of App text styles.
///
class AppTextStyles {

  static TextStyle heading = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

  static TextStyle title = TextStyle(fontSize: 20, fontWeight: FontWeight.w400);

  static TextStyle body = TextStyle(fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle label = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
}

///
/// Definition of App Theme.
///
ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
);
