import 'package:flutter/material.dart';

class AppBarThemer extends StatelessWidget implements PreferredSizeWidget {
  const AppBarThemer({
    Key? key,
    this.color,
    this.showBackButton = true,
  }) : super(key: key);

  final Color? color;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: color ?? Theme.of(context).colorScheme.primary,
      leading: !showBackButton
          ? null
          : IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
