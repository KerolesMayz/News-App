import 'package:flutter/material.dart';

class ConstantsManager {
  static Color getContrastingColor(Color color) {
    return color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}
