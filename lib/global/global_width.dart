// bool isWideScreen = false;

import 'package:flutter/material.dart';

class ScreenSize {
  static late double width;
  static late double height;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
  }
}