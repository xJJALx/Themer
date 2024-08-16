import 'package:themer/core/theme/domain/entities/color_themer.dart';
import 'package:themer/core/theme/domain/entities/color_type.dart';
import 'package:flutter/material.dart';

class ThemerUtils {
  static ColorThemer getDefaultColor() => ColorThemer.defaultColor();

  static ColorThemer buildColorThemer(List<ColorThemer> colors, ColorType type) {
    return colors.firstWhere(
      (item) => item.type == type,
      orElse: getDefaultColor,
    );
  }

  static ColorType buildColorType(String value) {
    return ColorType.values.firstWhere(
      (type) => type.name == value,
      orElse: () => ColorType.defaultColor,
    );
  }

  static Border getBorderBlackOrWhite(int colorTheme, Color color) {
    return colorTheme == color.value
        ? Border.all(color: Colors.white, width: 3)
        : Border.all(color: Colors.black, width: 1.5);
  }

  static MaterialColor createMaterialColor(Color color) {
    final Map<int, Color> swatch = {
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color.withOpacity(0.6),
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color.withOpacity(1),
    };
    return MaterialColor(color.value, swatch);
  }
}
