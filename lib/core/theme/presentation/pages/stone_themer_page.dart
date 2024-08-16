import 'package:themer/core/theme/presentation/widgets/dialog_palette_themer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:themer/core/theme/presentation/providers/app_themer_provider.dart';

class StoneThemerPage extends StatelessWidget {
  const StoneThemerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: const AppBarThemer(showBackButton: false),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _Stones(),
          _GradientFilter(),
        ],
      ),
      floatingActionButton: DialogPaletteThemer(),
    );
  }
}

class _Stones extends ConsumerWidget {
  const _Stones();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = ref.watch(appColorProvider);

    return Positioned(
      top: MediaQuery.of(context).size.height * 0.22,
      left: 0,
      right: 0,
      height: MediaQuery.of(context).size.height * 0.5,
      child:
          appColor.image!.isNotEmpty ? Image.asset(appColor.image!, fit: BoxFit.cover) : const Placeholder(),
    );
  }
}

class _GradientFilter extends ConsumerWidget {
  const _GradientFilter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = ref.watch(appColorProvider);

    var colors = [
      appColor.value,
      Colors.black,
      Colors.transparent,
      Colors.transparent,
      Colors.black,
      appColor.value,
    ];

    var stops = const [0.0, 0.25, 0.38, 0.52, 0.65, 1.0];

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: MediaQuery.of(context).size.height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
