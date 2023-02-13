import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _bottomAppBarColor = Color(0xff7D3108);
  static const Color _appBarColor = Color(0xff7D3108);
  static const Color _scaffoldBackgroundCoor = Colors.white;
  static const Color _primary = Color(0xff7D3108);
  static const Color _secondary = Color(0xffF6A579);
  static const Color _tertiary = Color.fromARGB(255, 206, 182, 159);
  static const Color _onPrimary = Colors.white;
  static const Color _primaryTextColor = Colors.white;
  static const Color _secondaryTextColor = Color(0xff7D3108);
  static const Color _iconColor = Colors.white;

  static const TextStyle _headingText1 = TextStyle(
    color: _primaryTextColor,
    fontFamily: "Rubik",
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const TextStyle _headingText2 = TextStyle(
    color: _secondaryTextColor,
    fontFamily: "Rubik",
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const TextStyle _bodyText = TextStyle(
    color: _primaryTextColor,
    fontFamily: "Rubik",
    fontSize: 14,
  );

  static const TextTheme _textTheme = TextTheme(
    headline1: _headingText1,
    headline2: _headingText2,
    bodyText1: _bodyText,
  );

  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: _scaffoldBackgroundCoor,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: _primaryTextColor,
      ),
      color: _appBarColor,
      iconTheme: IconThemeData(color: _iconColor),
    ),
    bottomAppBarColor: _bottomAppBarColor,
    colorScheme: const ColorScheme.light(
      primary: _primary,
      secondary: _secondary,
      tertiary: _tertiary,
      onPrimary: _onPrimary,
    ),
    textTheme: _textTheme,
  );
}
