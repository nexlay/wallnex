import 'package:flutter/material.dart';
import 'package:wallnex/const.dart';
import 'package:wallnex/presentation/pages/wallpaper_detail_page/widgets/buttons_bar/buttons_bar_item.dart';

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: List<Widget>.generate(
        btnBarAssetList.length,
        (index) => ButtonsBarItem(
          path: btnBarAssetList[index],
          imagePath: imagePath,
          index: index,
        ),
      ),
    );
  }
}
