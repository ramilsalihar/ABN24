import 'package:flutter/material.dart';
import 'package:project_name/presentation/core/theme/colors/app_colors.dart';
import 'package:project_name/presentation/core/theme/dimens/dimens.dart';

class AppTextTheme extends TextTheme {
  final AppColors colors;
  final Dimens dimens;

  AppTextTheme({
    required this.colors,
    required this.dimens,
  }) : super(
          displayLarge: TextStyle(
            fontSize: dimens.textDisplayLarge,
            color: colors.black,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            fontSize: dimens.textDisplayMedium,
            color: colors.black,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: TextStyle(
            fontSize: dimens.textHeadlineLarge,
            color: colors.green,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: TextStyle(
            fontSize: dimens.textHeadlineMedium,
            color: colors.white,
            fontWeight: FontWeight.w600,
          ),
          headlineSmall: TextStyle(
            fontSize: dimens.textHeadlineSmall,
            color: colors.white,
            fontWeight: FontWeight.w400,
          ),
        );
}
