import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:themer/core/theme/domain/entities/color_type.dart';
import 'package:themer/core/theme/domain/use_cases/get_accent_mode.dart';
import 'package:themer/core/theme/domain/use_cases/get_app_color.dart';
import 'package:themer/core/theme/domain/use_cases/save_accent_mode.dart';
import 'package:themer/core/theme/domain/use_cases/save_app_color.dart';
import 'package:themer/core/theme/domain/use_cases/get_dark_mode.dart';
import 'package:themer/core/theme/domain/use_cases/save_dark_mode.dart';
import 'package:themer/core/theme/infrastructure/datasources/local_storage_color_themer_datasource_impl.dart';
import 'package:themer/core/theme/infrastructure/repositories/local_storage_color_themer_repository_impl.dart';
import 'package:themer/core/shared/utils/themer_utils.dart';

part 'local_storage_themer_provider.g.dart';

@riverpod
class ColorStorage extends _$ColorStorage {
  final GetAppColorUseCase _getAppColorUseCase;
  final SaveAppColorUseCase _saveAppColorUseCase;

  ColorStorage()
      : _getAppColorUseCase = GetAppColorUseCase(
          repository: LocalStorageColorThemerRepositoryImpl(
            datasource: LocalStorageColorThemerDatasourceImpl(),
          ),
        ),
        _saveAppColorUseCase = SaveAppColorUseCase(
          repository: LocalStorageColorThemerRepositoryImpl(
            datasource: LocalStorageColorThemerDatasourceImpl(),
          ),
        );

  @override
  Future<ColorType> build() => getColorStorage();

  Future<ColorType> getColorStorage() async {
    String? colorType = await _getAppColorUseCase.call<String>("ColorStorage");
    return ThemerUtils.buildColorType(colorType!);
  }

  Future<void> setColorStorage(ColorType color) async {
    await _saveAppColorUseCase.call("ColorStorage", color.name);
    state = AsyncValue.data(color);
  }
}

@riverpod
class AccentModeStorage extends _$AccentModeStorage {
  final GetAccentModeUseCase _getAccentModeUseCase;
  final SaveAccentModeUseCase _saveAccentModeUseCase;

  AccentModeStorage()
      : _getAccentModeUseCase = GetAccentModeUseCase(
          repository: LocalStorageColorThemerRepositoryImpl(
            datasource: LocalStorageColorThemerDatasourceImpl(),
          ),
        ),
        _saveAccentModeUseCase = SaveAccentModeUseCase(
          repository: LocalStorageColorThemerRepositoryImpl(
            datasource: LocalStorageColorThemerDatasourceImpl(),
          ),
        );

  @override
  Future<bool> build() => getAccentMode();

  Future<bool> getAccentMode() async {
    return await _getAccentModeUseCase.call<bool>("AccentModeStorage") ?? false;
  }

  Future<void> setAccentMode(bool mode) async {
    await _saveAccentModeUseCase.call("AccentModeStorage", mode);
    state = AsyncValue.data(mode);
  }
}

@riverpod
class DarkModeStorage extends _$DarkModeStorage {
  final GetDarkModeUseCase _getDarkModeUseCase;
  final SaveDarkModeUseCase _saveDarkModeUseCase;

  DarkModeStorage()
      : _getDarkModeUseCase = GetDarkModeUseCase(
          repository: LocalStorageColorThemerRepositoryImpl(
            datasource: LocalStorageColorThemerDatasourceImpl(),
          ),
        ),
        _saveDarkModeUseCase = SaveDarkModeUseCase(
          repository: LocalStorageColorThemerRepositoryImpl(
            datasource: LocalStorageColorThemerDatasourceImpl(),
          ),
        );

  @override
  Future<bool> build() => getDarkMode();

  Future<bool> getDarkMode() async {
    return await _getDarkModeUseCase.call<bool>("DarkModeStorage") ?? false;
  }

  Future<void> setDarkMode(bool mode) async {
    await _saveDarkModeUseCase.call("DarkModeStorage", mode);
    state = AsyncValue.data(mode);
  }
}



// @riverpod
// class ColorStorage extends _$ColorStorage {
//   late final GetAppColorUseCase _getAppColorUseCase;
//   late final SaveAppColorUseCase _saveAppColorUseCase;
//   final dataSource = LocalColorStorageThemerDatasourceImpl();
//   ColorStorage() {
//     final repository = LocalColorStorageThemerRepositoryImpl(datasource: dataSource);
//     _getAppColorUseCase = GetAppColorUseCase(repository: repository);
//     _saveAppColorUseCase = SaveAppColorUseCase(repository: repository);
//   }
//   @override
//   Future<ColorType> build() => getColorStorage();
//   Future<ColorType> getColorStorage() async {
//     String? key = await _getAppColorUseCase.call<String>("CTK");
//     return key != null ? Utils.stringToColorType(key) : ColorType.noStorage;
//   }
//   Future<void> setColorStorage(ColorType color) async {
//     String key = color.toString();
//     await _saveAppColorUseCase.call("CTK", key);
//   }
// }