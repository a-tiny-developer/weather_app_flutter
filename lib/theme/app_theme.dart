import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.deepPurple;

  static const tempTextStyle = TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: 85.0,
  );

  static const messageTextStyle = TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: 55.0,
  );

  static const buttonTextStyle = TextStyle(
    fontSize: 30.0,
    fontFamily: 'Spartan MB',
  );

  static final ThemeData lighTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    // textTheme: lightTextTheme,
  );

  // static const TextTheme lightTextTheme = TextTheme();

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    // textTheme: darkTextTheme,
  );

  // static const TextTheme darkTextTheme = TextTheme();
}
