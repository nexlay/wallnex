import 'package:flutter/material.dart';

import '../../../../../../../common/ui/spacer.dart';

class ImageSingleSpec extends StatelessWidget {
  const ImageSingleSpec({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.iconSize,
    required this.icon,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final double iconSize;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: iconSize,
        ),
        showSpacer(height: 0.0, width: 3.0),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
