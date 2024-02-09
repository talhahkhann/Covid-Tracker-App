import 'package:flutter/material.dart';

var lightThemeData = ThemeData(
    primaryColor: Colors.blue,
    textTheme: new TextTheme(button: TextStyle(color: Colors.white70)),
    brightness: Brightness.light,
    hintColor: Colors.blue);

var darkThemeData = ThemeData(
    primaryColor: Colors.blue,
    textTheme: new TextTheme(button: TextStyle(color: Colors.black54)),
    brightness: Brightness.dark,
    hintColor: Colors.blue);