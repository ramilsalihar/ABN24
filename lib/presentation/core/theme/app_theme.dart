import 'package:flutter/material.dart';

import 'package:project_name/presentation/core/theme/colors/app_colors.dart';
import 'package:project_name/presentation/core/theme/dimens/dimens.dart';
import 'package:project_name/presentation/core/theme/text/text_theme.dart';

class AppThemes {
  static const _lightColors = appColorsLight;

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _lightColors.primaryColor,
    fontFamily: 'Fira Sans',
    appBarTheme: AppBarTheme(color: _lightColors.green),
    textTheme: AppTextTheme(
      colors: _lightColors,
      dimens: Dimens(),
    ),
  );

  static const _darkColors = appColorsDark;

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _darkColors.primaryColor,
    fontFamily: 'Fira Sans',
    appBarTheme: AppBarTheme(color: _darkColors.green),
    textTheme: AppTextTheme(
      colors: _darkColors,
      dimens: Dimens(),
    ),
  );
}
