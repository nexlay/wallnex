import 'package:flutter/material.dart';

class CustomPlaceholder extends StatelessWidget {
  const CustomPlaceholder({super.key, this.progress, this.color});

  final double? progress;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final baseColor = color ?? Colors.grey;
    final opacity = progress != null ? progress! / 5 : 0.2;

    return Container(
      color: baseColor.withOpacity(opacity),
    );
  }
}
