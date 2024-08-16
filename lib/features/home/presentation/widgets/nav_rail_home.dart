import 'package:themer/core/theme/presentation/widgets/dark_mode_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:themer/features/home/presentation/providers/nav_rail_home_provider.dart';

class NavRailHome extends ConsumerStatefulWidget {
  const NavRailHome({super.key});

  @override
  NavRailHomeState createState() => NavRailHomeState();
}

class NavRailHomeState extends ConsumerState<NavRailHome> {
  _onItemTapped(int index) => ref.read(navRailHomeIndexProvider.notifier).select(index);

  @override
  Widget build(BuildContext context) {
    final navRailHomeList = ref.watch(navRailHomeListProvider);
    final navRailIndex = ref.watch(navRailHomeIndexProvider);
    final navRailPage = ref.watch(navRailHomePageProvider);

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: navRailIndex,
            onDestinationSelected: _onItemTapped,
            labelType: NavigationRailLabelType.selected,
            destinations: navRailHomeList,
            groupAlignment: 0, // Centered items
            trailing: const Padding(
              padding: EdgeInsets.only(top: 50),
              child: DarkModeIcon(),
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: navRailPage)
        ],
      ),
    );
  }
}