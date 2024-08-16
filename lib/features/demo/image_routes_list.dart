import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:themer/core/theme/presentation/providers/color_themer_provider.dart';

class ImageRoutesList extends ConsumerWidget {
  const ImageRoutesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorsList = ref.watch(colorsListProvider);

    return Scaffold(
      body: colorsList.when(
        data: (colors) {
          return ListView.builder(
            itemCount: colors.length,
            itemBuilder: (context, index) {
              final color = colors[index];
              return ListTile(
                title: Text(color.image!),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
