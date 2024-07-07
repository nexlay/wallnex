import 'package:flutter/material.dart';

import '../../../../const/const.dart';

class ImageColors extends StatelessWidget {
  const ImageColors({super.key, required this.list});
  final List list;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        list.length,
        (index) => Card(
          color: Color(
            int.parse(
              list[index].replaceAll('#', '0xff'),
            ),
          ),
          child: const SizedBox(
            height: kUnselectedIconSize,
            width: kUnselectedIconSize,
          ),
        ),
      ).toList(),
    );
  }
}
