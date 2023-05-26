import 'package:flutter/material.dart';

ThemeData lightThemeData = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      cardColor: Colors.blueGrey[50],
      primarySwatch: Colors.blueGrey,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.blueGrey[900],
    ),
    iconTheme: const IconThemeData(color: Colors.blueGrey),
    brightness: Brightness.light,
    primaryTextTheme: TextTheme(
      labelLarge: TextStyle(
        color: Colors.blueGrey,
        decorationColor: Colors.blueGrey[300],
      ),
      titleSmall: TextStyle(
        color: Colors.blueGrey[900],
      ),
      titleMedium: const TextStyle(
        color: Colors.black,
      ),
      displayLarge: TextStyle(color: Colors.blueGrey[800]),
    ));

ThemeData darkThemeData = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: Colors.blueGrey[900],
      brightness: Brightness.light,
      cardColor: Colors.black,
      primarySwatch: Colors.blueGrey,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.blueGrey[900],
    ),
    iconTheme: const IconThemeData(color: Colors.blueGrey),
    brightness: Brightness.light,
    primaryTextTheme: TextTheme(
      labelLarge: TextStyle(
        color: Colors.blueGrey[200],
        decorationColor: Colors.blueGrey[50],
      ),
      titleSmall: const TextStyle(
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        color: Colors.blueGrey[300],
      ),
      displayLarge: const TextStyle(
        color: Colors.white70,
      ),
    ));
