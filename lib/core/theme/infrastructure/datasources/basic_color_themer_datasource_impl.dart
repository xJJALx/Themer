import 'package:flutter/material.dart';
import 'package:themer/core/theme/domain/entities/color_themer.dart';
import 'package:themer/core/theme/domain/entities/color_type.dart';
import 'package:themer/core/theme/domain/datasources/color_themer_datasource.dart';

class BasicColorThemerDatasourceImpl implements ColorThemerDatasource {
  @override
  Future<List<ColorThemer>> getAllColors() {
    List<ColorThemer> colors = [
      ColorThemer(
        title: 'Reality Red',
        value: const Color(0xFFe82048),
        type: ColorType.red,
      ),
      ColorThemer(
        title: 'Soul Orange',
        value: const Color(0xFFFF7F50),
        type: ColorType.orange,
      ),
      ColorThemer(
        title: 'Mind Yellow',
        value: const Color(0xFFE0D250),
        type: ColorType.yellow,
      ),
      ColorThemer(
        title: 'Time Green',
        value: const Color(0xFF27AE60),
        type: ColorType.green,
      ),
      ColorThemer(
        title: 'Space Blue',
        value: const Color(0xFF0645ad),
        type: ColorType.blue,
      ),
      ColorThemer(
        title: 'Power Violet',
        value: const Color(0xFF8b51f6),
        type: ColorType.violet,
      ),
    ];

    return Future.value(colors);
  }
}
