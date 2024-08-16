import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:themer/core/shared/extensions/extensions.dart';
import 'package:themer/core/theme/presentation/providers/app_themer_provider.dart';
import 'package:themer/core/theme/presentation/providers/local_storage_themer_provider.dart';
import 'package:themer/core/theme/presentation/widgets/appbar_themer.dart';
import 'package:themer/core/theme/presentation/widgets/dialog_palette_themer.dart';

class SquareThemerPage extends ConsumerWidget {
  const SquareThemerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeStorageProvider).asyncDefault(false);

    return Scaffold(
      appBar: AppBarThemer(
        color: darkMode ? const Color(0xFF2A282A) : const Color(0xECFFFFFF),
        showBackButton: false,
      ),
      backgroundColor: darkMode ? const Color(0xFF2A282A) : const Color(0xECFFFFFF),
      body: const SquareThemeName(),
      floatingActionButton: const DialogPaletteThemer(),
    );
  }
}

class SquareThemeName extends ConsumerWidget {
  const SquareThemeName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(appColorProvider);

    return Center(
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${color.title.split(' ')[0]}\n',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: color.title.split(' ').length >= 2 ? color.title.split(' ')[1] : '',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
