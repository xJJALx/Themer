import 'package:themer/core/theme/domain/entities/color_themer.dart';

abstract class ColorThemerDatasource {
  Future<List<ColorThemer>> getAllColors();
}
