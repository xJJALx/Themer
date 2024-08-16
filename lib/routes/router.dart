import 'package:themer/features/home/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:themer/core/entities/nav_menu_item.dart';
import 'package:themer/core/theme/presentation/pages/minimalist_themer_page.dart';
import 'package:themer/core/theme/presentation/pages/cupcake_themer_page.dart';
import 'package:themer/core/theme/presentation/pages/stone_themer_page.dart';
import 'package:themer/core/theme/presentation/pages/square_themer_page.dart';
import 'package:themer/features/home/presentation/pages/home_page.dart';
import 'package:themer/features/demo/appcolor_name.dart';
import 'package:themer/features/demo/image_routes_list.dart';
import 'package:themer/features/demo/random_image.dart';
import 'package:themer/features/demo/components_list_simple.dart';

part 'router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}

@riverpod
List<NavMenuItem> navRailHome(NavRailHomeRef ref) {
  return const [
    NavMenuItem(
      title: 'Welcome',
      icon: Icons.home,
      route: 'home/welcome',
      widget: WelcomePage(),
    ),
    NavMenuItem(
      title: 'List',
      icon: Icons.library_books_rounded,
      route: 'demo/image-routes-list',
      widget: ImageRoutesList(),
    ),
    NavMenuItem(
      title: 'Image',
      icon: Icons.image,
      route: 'demo/stone-image',
      widget: StoneImage(),
    ),
    NavMenuItem(
      title: 'Theme Name',
      icon: Icons.color_lens_outlined,
      route: 'demo/appcolor_name',
      widget: AppcolorName(),
    ),
    NavMenuItem(
      title: 'Cupcakes',
      icon: Icons.cake_rounded,
      route: 'themer/cupcake',
      widget: CupcakeThemerPage(),
    ),
    NavMenuItem(
      title: 'Stones',
      icon: Icons.diamond_outlined,
      route: 'themer/stones',
      widget: StoneThemerPage(),
    ),
    NavMenuItem(
      title: 'Square',
      icon: Icons.crop_square,
      route: 'themer/square',
      widget: SquareThemerPage(),
    ),
    NavMenuItem(
      title: 'Minimalist',
      icon: Icons.vertical_split_outlined,
      route: 'themer/minimalist',
      widget: MinimalistThemerPage(),
    ),
    NavMenuItem(
      title: 'Components',
      icon: Icons.view_compact_alt_outlined,
      route: 'demo/components-list-simple',
      widget: ComponentsListSimple(),
    ),
  ];
}
