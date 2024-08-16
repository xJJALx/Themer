import 'package:themer/core/theme/domain/datasources/color_themer_datasource.dart';
import 'package:themer/core/theme/domain/entities/color_themer.dart';
import 'package:themer/core/theme/domain/repositories/color_themer_repository.dart';
import 'package:themer/core/theme/infrastructure/datasources/basic_color_themer_datasource_impl.dart';

class ColorThemerRepositoryImpl implements ColorThemerRepository {
  final ColorThemerDatasource datasource;

  ColorThemerRepositoryImpl({ColorThemerDatasource? datasource})
      : datasource = datasource ?? BasicColorThemerDatasourceImpl();

  @override
  Future<List<ColorThemer>> getAllColors() {
    return datasource.getAllColors();
  }
}
