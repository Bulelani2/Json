import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.blueGrey,
    toolbarTextStyle: TextStyle(color: Colors.blue),
  ),
  brightness: Brightness.light,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blueGrey,
      ),
    ),
  ),
);
