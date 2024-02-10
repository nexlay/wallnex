import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.progress, this.imageColor});

  final double? progress;
  final String? imageColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: progress != null && imageColor != null
          ? Color(
              int.parse(
                imageColor!.replaceAll('#', '0xff'),
              ),
            ).withOpacity(progress! / 5)
          : Colors.grey.withOpacity(0.2),
    );
  }
}
