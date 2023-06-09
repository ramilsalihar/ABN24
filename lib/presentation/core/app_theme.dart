import 'package:flutter/material.dart';

class ABNTheme {
  static const Color primaryColorDark = Color(0xFF070C31);
  static const Color whiteOpacity = Color(0x45FFFFFF);

  static const Color primaryColorLight = Color(0xFFECECEC);

  static const TextTheme textTheme = TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  );

  static const ButtonStyle iconButtonStyle = ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(whiteOpacity),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColorLight,
    colorScheme: const ColorScheme.light(
      primary: primaryColorLight,
      onPrimary: Colors.white,
      secondary: primaryColorLight,
    ),
    textTheme: textTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColorDark,
    colorScheme: const ColorScheme.dark(
      primary: primaryColorDark,
      onPrimary: Colors.white,
      secondary: primaryColorDark,
    ),
    textTheme: textTheme,
  );
}