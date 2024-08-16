import 'package:flutter/material.dart';
import 'package:themer/core/theme/domain/entities/color_themer.dart';
import 'package:themer/core/theme/domain/entities/color_type.dart';
import 'package:themer/core/theme/domain/datasources/color_themer_datasource.dart';

class CupcakeColorThemerDatasourceImpl implements ColorThemerDatasource {
  @override
  Future<List<ColorThemer>> getAllColors() {
    List<ColorThemer> colors = [
      ColorThemer(
        title: 'Creamy Aqua',
        value: const Color(0xFF00FFEA),
        type: ColorType.defaultColor,
        image: 'assets/images/cupcake_aqua.png',
      ),
      ColorThemer(
        title: 'Creamy Red',
        value: const Color(0xFFe82048),
        type: ColorType.red,
        image: 'assets/images/cupcake_red.png',
      ),
      ColorThemer(
        title: 'Creamy Orange',
        value: const Color(0xFFFF7F50),
        type: ColorType.orange,
        image: 'assets/images/cupcake_orange.png',
      ),
      ColorThemer(
        title: 'Creamy Yellow',
        value: const Color(0xFFE0D250),
        type: ColorType.yellow,
        image: 'assets/images/cupcake_yellow.png',
      ),
      ColorThemer(
        title: 'Creamy Green',
        value: const Color(0xFF27AE60),
        type: ColorType.green,
        image: 'assets/images/cupcake_green.png',
      ),
      ColorThemer(
        title: 'Creamy Blue',
        value: const Color(0xFF0645ad),
        type: ColorType.blue,
        image: 'assets/images/cupcake_blue.png',
      ),
      ColorThemer(
        title: 'Creamy Violet',
        value: const Color(0xFF8b51f6),
        type: ColorType.violet,
        image: "assets/images/cupcake_violet.png",
      ),
    ];

    return Future.value(colors);
  }
}
