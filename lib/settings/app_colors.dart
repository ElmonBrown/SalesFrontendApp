import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color transparent = Color(0x00000000);
  static const Color primaryColor = Color(0xFF0088AC);
  static Color secondaryColor = Colors.white;
  static const Color backgroundColorDark = Color(0xFF393939);

  static const Color defaultIconColor = Color(0xFF2D256F);

  static const Color fieldsColor = Color(0xFFF7F7F7);

  // This primarySwatch has to be a color from material
  //static const MaterialColor primarySwatch = Colors.blue;

  static const MaterialColor primarySwatch =  MaterialColor(
    0xFF0088AC, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff007a9b ),//10%
      100: const Color(0xff006d8a),//20%
      200: const Color(0xff005f78),//30%
      300: const Color(0xff005267),//40%
      400: const Color(0xff004456),//50%
      500: const Color(0xff003645),//60%
      600: const Color(0xff003645),//70%
      700: const Color(0xff001b22),//80%
      800: const Color(0xff000e11),//90%
      900: const Color(0xff000000),//100%
    },
  );

  static const Color infoTitleTextColor = Color(0xFF696767);
  static const Color infoTextTextColor = Color(0xFFF7F7F7);

  static const Color cardColor = Color(0xFFF5F5F5);

  //Colors
  static const Color red = Color(0xFFCE0303);
  static const Color green = Color(0xFF008000);
  static const Color yellow = Color(0xFFD9B800);
}