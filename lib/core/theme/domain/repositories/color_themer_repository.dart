import 'package:themer/core/theme/domain/entities/color_themer.dart';

abstract class ColorThemerRepository {
  Future<List<ColorThemer>> getAllColors();
}
