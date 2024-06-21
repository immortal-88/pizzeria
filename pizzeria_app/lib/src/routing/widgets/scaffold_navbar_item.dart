import 'package:flutter/material.dart';

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem(
      {required this.initialLocation,
      required super.icon,
      super.label,
      super.activeIcon});

  /// The initial location/path
  final String initialLocation;
}
