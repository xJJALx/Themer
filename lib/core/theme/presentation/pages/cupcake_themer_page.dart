import 'dart:math';

import 'package:themer/core/shared/utils/themer_utils.dart';
import 'package:themer/core/theme/domain/entities/color_themer.dart';
import 'package:themer/core/theme/domain/entities/color_type.dart';
import 'package:themer/core/theme/presentation/providers/color_themer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:themer/core/theme/presentation/providers/app_themer_provider.dart';

//*
//*
//*
//! Pagina de pruebas, eliminar ya que no reutiliza los widgets y borrar los provider de ejemplo (ColorsListCupcakes etc)
//*
//*
//*

class CupcakeThemerPage extends StatelessWidget {
  const CupcakeThemerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const AppBarThemer(showBackButton: false),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const Stack(
        children: [
          _Shadow(),
          // _GradientFilter(),
          _Cupcakes(),
          _PaletteColorThemer(),
        ],
      ),
    );
  }
}

class _PaletteColorThemer extends ConsumerWidget {
  const _PaletteColorThemer();

  _setColor(WidgetRef ref, ColorType colorType) =>
      ref.read(colorFilterTypeProvider.notifier).setColor(colorType);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorsList = ref.watch(colorsListCupcakesProvider);

    return Positioned(
      left: 0,
      right: 0,
      bottom: MediaQuery.of(context).size.height * 0.1,
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: colorsList.when(
            data: (colors) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: colors.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  final color = colors[i];
                  return _PaletteItem(
                    color: color.value,
                    onTap: () => _setColor(ref, color.type),
                  );
                },
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}

class _PaletteItem extends ConsumerWidget {
  const _PaletteItem({
    required this.color,
    this.size = 42,
    this.radius = 50,
    this.onTap,
  });

  final Color color;
  final double size;
  final double radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeProvider).colorScheme.primary.value;

    return Container(
      margin: const EdgeInsets.all(2),
      width: size,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white10,
        borderRadius: BorderRadius.circular(radius),
        child: Ink(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
            border: ThemerUtils.getBorderBlackOrWhite(colorTheme, color),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 5,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Cupcakes extends ConsumerWidget {
  const _Cupcakes();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = ref.watch(appColorCupcakesProvider);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double diagonal = sqrt(pow(width, 2) + pow(height, 2));

    return Positioned(
      top: 0,
      left: diagonal * 0.025,
      right: diagonal * 0.025,
      bottom: MediaQuery.of(context).size.height * 0.15,
      child: appColor.image!.isNotEmpty
          ? Image.asset(
              appColor.image!,
              fit: BoxFit.cover,
            )
          : Image.asset(
              ColorThemer.defaultColor().image!,
              fit: BoxFit.cover,
            ),
    );
  }
}

class _Shadow extends StatelessWidget {
  const _Shadow();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double diagonal = sqrt(pow(width, 2) + pow(height, 2));

    return Positioned(
      top: MediaQuery.of(context).size.height * 0.55,
      left: diagonal * 0.025,
      right: diagonal * 0.025,
      bottom: MediaQuery.of(context).size.height * 0.25,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(120, 255, 255, 255),
              spreadRadius: 0,
              blurRadius: 80,
              offset: Offset(0, 0),
            ),
          ],
        ),
      ),
    );
  }
}