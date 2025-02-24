import 'dart:math';

import 'package:flutter/material.dart';

//! app theme colors

class MyColors {
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color primaryColor = Color.fromARGB(255, 38, 164, 164);
  static const Color secondaryColor = Color.fromARGB(255, 38, 174, 174);
  static const Color appGreenColor = Color(0xFF279C85);
  static const Color blueIconsColor = Color.fromARGB(255, 10, 141, 188);
  static const Color lightGreyColor = Color(0xFFAFAFAF);
  static const Color lightColor = Color.fromARGB(119, 175, 175, 175);
  static const Color darkGreyColor = Color(0xFF818181);
  static const Color errorRed = Color.fromARGB(255, 237, 83, 83);
  static const Gradient themeGradient = LinearGradient( transform: GradientRotation(90 * pi / 180), colors: [Color.fromARGB(222, 55, 244, 235), Color.fromARGB(255, 31, 177, 177)]);
}
