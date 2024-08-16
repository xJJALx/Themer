import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:themer/core/theme/domain/entities/color_themer.dart';
import 'package:themer/core/theme/presentation/providers/color_themer_provider.dart';
import 'package:themer/core/theme/presentation/providers/local_storage_themer_provider.dart';
import 'package:themer/core/shared/extensions/extensions.dart';
import 'package:themer/core/shared/utils/themer_utils.dart';

part 'app_themer_provider.g.dart';

@Riverpod()
ThemeData appTheme(AppThemeRef ref) {
  final colorScheme = ref.watch(colorSchemeProvider);

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    fontFamily: GoogleFonts.rubik().fontFamily,
    // fontFamily: GoogleFonts.montserrat().fontFamily,
  );
}

@riverpod
ColorThemer appColor(AppColorRef ref) {
  final filterType = ref.watch(colorFilterTypeProvider);
  final colorsList = ref.watch(colorsListProvider).asyncDefault(<ColorThemer>[]);
  final colorStorage = ref.watch(colorStorageProvider).asyncDefault(filterType);

  return ThemerUtils.buildColorThemer(colorsList, colorStorage);
}

@riverpod
ColorThemer appColorCupcakes(AppColorCupcakesRef ref) {
  final filterType = ref.watch(colorFilterTypeProvider);
  final colorsList = ref.watch(colorsListCupcakesProvider).asyncDefault(<ColorThemer>[]);
  final colorStorage = ref.watch(colorStorageProvider).asyncDefault(filterType);

  return ThemerUtils.buildColorThemer(colorsList, colorStorage);
}

@riverpod
ColorScheme colorScheme(ColorSchemeRef ref) {
  final appColor = ref.watch(appColorProvider).value;
  final accentMode = ref.watch(accentModeStorageProvider).asyncDefault(false);
  final darkMode = ref.watch(darkModeStorageProvider).asyncDefault(false);

  return accentMode
      ? ColorScheme.fromSwatch(
          backgroundColor: darkMode ? Colors.grey[900] : const Color(0xECFFFFFF),
          primarySwatch: ThemerUtils.createMaterialColor(appColor),
          accentColor: ThemerUtils.createMaterialColor(appColor.withOpacity(0.70)),
          cardColor: ThemerUtils.createMaterialColor(appColor.withOpacity(0.5)),
          brightness: darkMode ? Brightness.dark : Brightness.light,
        )
      : ColorScheme.fromSeed(
          seedColor: appColor,
          primary: appColor,
          brightness: darkMode ? Brightness.dark : Brightness.light,
        );
}

@riverpod
class HardMode extends _$HardMode {
  @override
  bool? build() => null;

  toggle(bool value) => state = value;
}


// @riverpod
// ColorThemer appColor(AppColorRef ref) {
//   final filterType = ref.watch(colorFilterTypeProvider);
//   final colorsList = ref.watch(colorsListProvider);
//   return colorsList.when(
//     data: (colors) => colors.firstWhere((item) => item.type == filterType, orElse: () => colors.first),
//     loading: () => ColorThemer.defaultColor(),
//     error: (_, __) => throw Exception('Colors are still loading'),
//   );
// }