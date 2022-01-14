import 'package:flutter/material.dart';

class Themes {
  Themes._();

  static final light = ThemeData.light().copyWith(
    // light theme settings
    indicatorColor: Colors.black,
    backgroundColor: Colors.white,
  );
  static final dark = ThemeData.dark().copyWith(
    // dark theme settings
    indicatorColor: Colors.white,
    backgroundColor: Colors.black,
  );
}
