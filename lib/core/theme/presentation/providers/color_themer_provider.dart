import 'package:themer/core/theme/infrastructure/datasources/cupcake_color_themer_datasource_impl.dart';
import 'package:themer/core/theme/presentation/providers/local_storage_themer_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:themer/core/theme/domain/entities/color_themer.dart';
import 'package:themer/core/theme/domain/entities/color_type.dart';
import 'package:themer/core/theme/domain/use_cases/get_all_colors.dart';
import 'package:themer/core/theme/infrastructure/datasources/stone_color_themer_datasource_impl.dart';
import 'package:themer/core/theme/infrastructure/repositories/color_themer_repository_impl.dart';

part 'color_themer_provider.g.dart';

@riverpod
class ColorsList extends _$ColorsList {
  final GetAllColorsUseCase _getAllColorsUseCase;

  ColorsList()
      : _getAllColorsUseCase = GetAllColorsUseCase(
          repository: ColorThemerRepositoryImpl(
            datasource: StoneColorThemerDatasourceImpl(),
          ),
        );

  @override
  Future<List<ColorThemer>> build() async => await _fetchAllColors();

  Future<List<ColorThemer>> _fetchAllColors() async {
    return await _getAllColorsUseCase.call();
  }
}

@riverpod
class ColorsListCupcakes extends _$ColorsListCupcakes {
  final GetAllColorsUseCase _getAllColorsUseCase;

  ColorsListCupcakes()
      : _getAllColorsUseCase = GetAllColorsUseCase(
          repository: ColorThemerRepositoryImpl(
            datasource: CupcakeColorThemerDatasourceImpl(),
          ),
        );

  @override
  Future<List<ColorThemer>> build() async => await _fetchAllColors();

  Future<List<ColorThemer>> _fetchAllColors() async {
    return await _getAllColorsUseCase.call();
  }
}

@Riverpod(keepAlive: true)
class ColorFilterType extends _$ColorFilterType {
  @override
  ColorType build() => ColorType.defaultColor;

  setColor(ColorType newColor) {
    ref.read(colorStorageProvider.notifier).setColorStorage(newColor);
    return state = newColor;
  }
}
