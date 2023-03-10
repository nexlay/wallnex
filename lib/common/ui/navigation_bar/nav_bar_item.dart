import 'package:flutter/material.dart';

class NavBarItem extends NavigationDestination {
  const NavBarItem({super.key, required super.icon, required super.label, required this.location});

  final String location;
}