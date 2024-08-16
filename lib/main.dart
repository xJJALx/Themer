import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:themer/routes/router.dart';
import 'package:themer/core/theme/presentation/providers/app_themer_provider.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final appTheme = ref.watch(appThemeProvider);
    
    return MaterialApp.router(
      title: 'Themer App',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: appTheme,
    );
  }
}
