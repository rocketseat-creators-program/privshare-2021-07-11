import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    primaryColor: Colors.red,
    accentColor: Colors.red,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    accentColor: Colors.red,
  );
}
