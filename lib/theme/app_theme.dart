import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.deepPurple;

  static const tempTextStyle = TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: 82.0,
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
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.black,
      iconColor: Colors.black,
      hintStyle: TextStyle(color: Colors.white),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide.none,
      ),
    ),
    // textTheme: lightTextTheme,
  );

  // static const TextTheme lightTextTheme = TextTheme();

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      iconColor: Colors.white,
      hintStyle: TextStyle(color: Colors.black),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide.none,
      ),
    ),
    // textTheme: darkTextTheme,
  );

  // static const TextTheme darkTextTheme = TextTheme();
}
