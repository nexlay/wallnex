import 'package:flutter/material.dart';
import '../../../../const.dart';
import 'custom_nav_bar_item.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List<Widget>.generate(
          navBarAssetList.length,
          (index) => CustomNavBarItem(
            path: navBarAssetList.elementAt(index),
            label: labelList.elementAt(index),
            tabIndex: index,
          ),
        ).toList(),
      ),
    );
  }
}
