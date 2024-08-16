import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:themer/core/theme/domain/entities/color_type.dart';
import 'package:themer/core/theme/presentation/widgets/palette_item.dart';
import 'package:themer/core/theme/presentation/providers/color_themer_provider.dart';

class PaletteColorThemer extends ConsumerWidget {
  const PaletteColorThemer({super.key});

  _setColor(WidgetRef ref, ColorType colorType) =>
      ref.read(colorFilterTypeProvider.notifier).setColor(colorType);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorsList = ref.watch(colorsListProvider);

    return SizedBox(
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
                return PaletteItem(
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
    );
  }
}
