import 'package:flutter/material.dart';

import 'image_single_spec.dart';

class ImageSpecsBar extends StatelessWidget {
  const ImageSpecsBar({
    Key? key,
    required this.size,
    required this.downloads,
    required this.resolution,
    required this.fontSize,
    required this.iconSize,
  }) : super(key: key);

  final String size;
  final String downloads;
  final String resolution;
  final double fontSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ImageSingleSpec(
            text: size,
            fontSize: fontSize,
            iconSize: iconSize,
            icon: Icons.sd_storage_outlined),
        ImageSingleSpec(
            text: downloads,
            fontSize: fontSize,
            iconSize: iconSize,
            icon: Icons.download_outlined),
        ImageSingleSpec(
            text: resolution,
            fontSize: fontSize,
            iconSize: iconSize,
            icon: Icons.photo_size_select_large_outlined),
      ],
    );
  }
}
