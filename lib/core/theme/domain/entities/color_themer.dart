import 'package:flutter/material.dart';
import 'package:themer/core/theme/domain/entities/color_type.dart';

class ColorThemer {
  final String title;
  final Color value;
  final ColorType type;
  final String? image;

  ColorThemer({
    required this.title,
    required this.value,
    required this.type,
    this.image = '',
  });

  static ColorThemer defaultColor() {
    return ColorThemer(
      title: 'Default Aqua',
      value: const Color.fromARGB(255, 0, 255, 234),
      type: ColorType.defaultColor,
      image: 'assets/images/cupcake_aqua.png',
    );
  }
}