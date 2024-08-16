import 'package:themer/core/theme/presentation/widgets/palette_color_themer.dart';
import 'package:themer/core/theme/presentation/widgets/switches_modes.dart';
import 'package:flutter/material.dart';

class DialogPaletteThemer extends StatelessWidget {
  const DialogPaletteThemer({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _selectColorThemer(context),
      child: const Icon(Icons.color_lens_outlined),
    );
  }

  Future<void> _selectColorThemer(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Theme')),
          content: const SizedBox(
            height: 250,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SwitchModes(),
                PaletteColorThemer(),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
