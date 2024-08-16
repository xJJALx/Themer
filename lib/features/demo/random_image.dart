import 'dart:math';
import 'package:themer/core/theme/presentation/providers/app_themer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:themer/core/theme/presentation/providers/color_themer_provider.dart';

class StoneImage extends ConsumerWidget {
  const StoneImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(appColorProvider);

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: MediaQuery.of(context).size.height,
          child: color.image != null && color.image!.isNotEmpty
              ? Image.asset(color.image!, fit: BoxFit.cover)
              : const Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}

class RandomImage extends ConsumerWidget {
  const RandomImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorsList = ref.watch(colorsListProvider);

    return colorsList.when(
      data: (colors) {
        final randomIndex = colors.isNotEmpty ? Random().nextInt(colors.length) : 0;
        final image = colors.isNotEmpty ? colors[randomIndex].image : null;

        return Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height,
              child: image != null && image.isNotEmpty
                  ? Image.asset(image, fit: BoxFit.cover)
                  : const Placeholder(),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
