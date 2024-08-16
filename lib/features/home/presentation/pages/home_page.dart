import 'package:flutter/material.dart';

import 'package:themer/features/home/presentation/widgets/signature.dart';
import 'package:themer/features/home/presentation/widgets/nav_rail_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NavRailHome(),
      floatingActionButton: Signature(),
    );
  }
}