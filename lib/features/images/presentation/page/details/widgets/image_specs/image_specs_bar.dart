import 'package:flutter/material.dart';

import 'image_single_spec.dart';

class ImageSpecsBar extends StatelessWidget {
  const ImageSpecsBar({
    Key? key,
    required this.size,
    required this.views,
    required this.resolution,
    required this.fontSize,
    required this.iconSize,

  }) : super(key: key);

  final int size;
  final int views;
  final String resolution;
  final double fontSize;
  final double iconSize;



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ImageSingleSpec(
            text: '${double.parse((size / 1000000).toStringAsFixed(1))} MB',
            fontSize: fontSize,
            iconSize: iconSize,
            icon: Icons.sd_storage_outlined,
        ),
        ImageSingleSpec(
            text: views.toString(),
            fontSize: fontSize,
            iconSize: iconSize,
            icon: Icons.remove_red_eye_outlined,
        ),
        ImageSingleSpec(
            text: resolution,
            fontSize: fontSize,
            iconSize: iconSize,
            icon: Icons.photo_size_select_actual_outlined,
       ),
      ],
    );
  }
}
