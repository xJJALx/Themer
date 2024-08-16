import 'package:flutter/material.dart';
import 'package:themer/core/theme/domain/entities/color_themer.dart';
import 'package:themer/core/theme/domain/entities/color_type.dart';
import 'package:themer/core/theme/domain/datasources/color_themer_datasource.dart';

class StoneColorThemerDatasourceImpl implements ColorThemerDatasource {
  @override
  Future<List<ColorThemer>> getAllColors() {
    List<ColorThemer> colors = [
      ColorThemer(
        title: 'Reality Red',
        value: const Color(0xFFe82048),
        type: ColorType.red,
        image: 'assets/images/reality_stone_RED.jpg',
      ),
      ColorThemer(
        title: 'Soul Orange',
        value: const Color(0xFFFF7F50),
        type: ColorType.orange,
        image: 'assets/images/soul_stone_ORANGE.jpg',
      ),
      ColorThemer(
        title: 'Mind Yellow',
        value: const Color(0xFFE0D250),
        type: ColorType.yellow,
        image: 'assets/images/mind_stone_YELLOW.jpg',
      ),
      ColorThemer(
        title: 'Time Green',
        value: const Color(0xFF27AE60),
        type: ColorType.green,
        image: 'assets/images/time_stone_GREEN.jpg',
      ),
      ColorThemer(
        title: 'Space Blue',
        value: const Color(0xFF0645ad),
        type: ColorType.blue,
        image: 'assets/images/space_stone_BLUE.jpg',
      ),
      ColorThemer(
        title: 'Power Violet',
        value: const Color(0xFF8b51f6),
        type: ColorType.violet,
        image: "assets/images/power_stone_PURPLE.jpg",
      ),
    ];

    // return Future.value(colors);
        return Future.delayed(const Duration(seconds: 15), () => colors);
  }
}
