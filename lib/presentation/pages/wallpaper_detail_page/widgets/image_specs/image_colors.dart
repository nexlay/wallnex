import 'package:flutter/material.dart';
import 'package:wallnex/const.dart';

class ImageColors extends StatelessWidget {
  const ImageColors({Key? key, required this.list}) : super(key: key);
  final List list;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        list.length,
        (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 21.0,
            backgroundColor: mainLightThemeColor,
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor: Color(
                int.parse(
                  list[index].replaceAll('#', '0xff'),
                ),
              ),
            ),
          ),
        ),
      ).toList(),
    );
  }
}
