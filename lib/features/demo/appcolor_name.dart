import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:themer/core/theme/presentation/providers/app_themer_provider.dart';

class AppcolorName extends ConsumerWidget {
  const AppcolorName({super.key});

 @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appcolor = ref.watch(appColorProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${appcolor.title.split(' ')[0]}\n',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    fontSize: 75,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: appcolor.title.split(' ').length >= 2 ? appcolor.title.split(' ')[1] : '',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondaryContainer,
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
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
          )
        ],
      ),
    );
  }
}