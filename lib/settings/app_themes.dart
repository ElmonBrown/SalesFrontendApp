import 'package:flutter/material.dart';

import 'app_colors.dart';

final ThemeData appTheme = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: AppColors.primaryColor,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ));
final ThemeData appThemeDark = ThemeData();
