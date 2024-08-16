import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:themer/core/shared/extensions/extensions.dart';
import 'package:themer/core/theme/presentation/providers/local_storage_themer_provider.dart';

class DarkModeIcon extends ConsumerWidget {
  const DarkModeIcon({super.key});

  _setDarkMode(WidgetRef ref, bool mode) => ref.read(darkModeStorageProvider.notifier).setDarkMode(mode);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(darkModeStorageProvider).asyncDefault(false);

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.primaryContainer,
          width: 0,
        ),
      ),
      child: IconButton(
        onPressed: () => _setDarkMode(ref, !darkMode),
        icon: Icon(darkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
      ),
    );
  }
}
