import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themer/routes/router.dart';

part 'nav_rail_home_provider.g.dart';

@riverpod
class NavRailHomeList extends _$NavRailHomeList {
  @override
  List<NavigationRailDestination> build() {
    final navRailHome = ref.watch(navRailHomeProvider);

    return [
      ...navRailHome.map((item) {
        return NavigationRailDestination(
          icon: Icon(item.icon),
          label: Text(item.title),
        );
      }).toList(),
    ];
  }
}

@riverpod
class NavRailHomeIndex extends _$NavRailHomeIndex {
  @override
  int build() => 0;

  select(int value) => state = value;
}

@riverpod
Widget navRailHomePage(NavRailHomePageRef ref) {
  final navRailHome = ref.watch(navRailHomeProvider);
  final index = ref.watch(navRailHomeIndexProvider);

  return navRailHome[index].widget;
}
