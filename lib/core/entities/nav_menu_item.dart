import 'package:flutter/material.dart';

class NavMenuItem {
  final String title;
  final IconData icon;
  final String route;
  final String? subTitle;
  final Widget widget;

  const NavMenuItem({
    required this.title,
    required this.icon,
    required this.route,
    this.subTitle,
    Widget? widget,
  }) : widget = widget ?? const Chip(label: Text('No Widget'));
}
