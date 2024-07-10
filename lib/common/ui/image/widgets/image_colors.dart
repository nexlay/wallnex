import 'package:flutter/material.dart';
import '../../../../const/const.dart';

class ImageColors extends StatelessWidget {
  const ImageColors({super.key, required this.colorHexList});
  final List<String> colorHexList; // Renamed for clarity

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: colorHexList.map((colorHex) {
        // Use map for more concise and readable iteration
        return Card(
          color: Color(int.parse(colorHex.replaceFirst('#', '0xff'))),
          // Simplified color parsing
          child: const SizedBox(
            height: kUnselectedIconSize,
            width: kUnselectedIconSize,
          ),
        );
      }).toList(),
    );
  }
}
