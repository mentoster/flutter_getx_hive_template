import 'package:flutter/material.dart';

final ThemeData appThemeDataLight = ThemeData(
  primaryColor: Colors.blueAccent,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
  fontFamily: 'Georgia',
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);

final ThemeData appThemeDataDark = ThemeData(
  primaryColor: Colors.blueAccent,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
  fontFamily: 'Georgia',
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);
