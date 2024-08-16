import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:themer/core/theme/presentation/providers/app_themer_provider.dart';
import 'package:themer/core/theme/presentation/widgets/dialog_palette_themer.dart';
import 'package:themer/core/theme/presentation/widgets/appbar_themer.dart';

class MinimalistThemerPage extends StatelessWidget {
  const MinimalistThemerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarThemer(showBackButton: false),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const _MinimalistThemeName(),
      floatingActionButton: const DialogPaletteThemer(),
    );
  }
}

class _MinimalistThemeName extends ConsumerWidget {
  const _MinimalistThemeName();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(appColorProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${color.title.split(' ')[0]}\n',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 75,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: color.title.split(' ').length >= 2 ? color.title.split(' ')[1] : '',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 75,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 135,
            height: 6,
            margin: const EdgeInsets.only(top: 10, left: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          )
        ],
      ),
    );
  }
}
