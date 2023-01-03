import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomHeader extends SliverPersistentHeaderDelegate {
  CustomHeader(
      {required this.childWidget,
      required this.maxExtend,
      required this.minExtend});

  final Widget childWidget;
  final double maxExtend;
  final double minExtend;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return childWidget;
  }

  @override
  double get maxExtent => maxExtend;

  @override
  double get minExtent => minExtend;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
