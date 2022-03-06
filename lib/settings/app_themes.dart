import 'package:flutter/material.dart';

import 'app_colors.dart';

final ThemeData appTheme = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: AppColors.primaryColor,
    primarySwatch: AppColors.primarySwatch,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ));
final ThemeData appThemeDark = ThemeData();
