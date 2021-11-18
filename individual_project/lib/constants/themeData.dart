import 'package:flutter/material.dart';

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> amber = [Colors.red, Colors.orange];

}
class GradientTemplate {
  static List<GradientColors> gradientTemplate = [
    GradientColors(GradientColors.amber),
  ];
}