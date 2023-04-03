import 'package:flutter/material.dart';
import '../../../const/const_rive.dart';
import '../../../core/config/l10n/generated/app_localizations.dart';
import 'custom_nav_bar_item.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titles = [
      L.of(context).home,
      L.of(context).favorites,
      L.of(context).profile,
    ];
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List<Widget>.generate(
          kNavBarAssetList.length,
          (index) => CustomNavBarItem(
            path: kNavBarAssetList.elementAt(index),
            label: titles.elementAt(index),
            tabIndex: index,
          ),
        ).toList(),
      ),
    );
  }
}
