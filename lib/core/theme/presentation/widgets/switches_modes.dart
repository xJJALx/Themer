import 'package:themer/core/shared/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:themer/core/theme/presentation/providers/local_storage_themer_provider.dart';

class SwitchModes extends ConsumerStatefulWidget {
  const SwitchModes({super.key});

  @override
  SwitchModesState createState() => SwitchModesState();
}

class SwitchModesState extends ConsumerState<SwitchModes> {
  _setAccentMode(WidgetRef ref, bool mode) =>
      ref.read(accentModeStorageProvider.notifier).setAccentMode(mode);

  _setDarkMode(WidgetRef ref, bool mode) => 
      ref.read(darkModeStorageProvider.notifier).setDarkMode(mode);

  @override
  Widget build(BuildContext context) {
    var accentMode = ref.watch(accentModeStorageProvider).asyncDefault(false);
    var darkMode = ref.watch(darkModeStorageProvider).asyncDefault(false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Accent Mode",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                // color: Colors.white,
              ),
            ),
            Switch(
              value: accentMode,
              inactiveThumbColor: Theme.of(context).colorScheme.primary,
              hoverColor: Colors.white70,
              onChanged: (bool value) => _setAccentMode(ref, value),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Dark mode",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                // color: Colors.white,
              ),
            ),
            Switch(
              value: darkMode,
              inactiveThumbColor: Theme.of(context).colorScheme.primary,
              hoverColor: Colors.white70,
              onChanged: (bool value) => _setDarkMode(ref, value),
            ),
          ],
        ),
      ],
    );
  }
}
