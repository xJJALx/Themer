import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:themer/core/shared/utils/themer_utils.dart';
import 'package:themer/core/theme/presentation/providers/app_themer_provider.dart';

class PaletteItem extends ConsumerWidget {
  const PaletteItem({
    super.key,
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
                color: Colors.black.withOpacity(0.4),
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
