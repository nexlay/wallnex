import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../const/const_rive.dart';
import 'custom_nav_bar_item.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titles = [
      AppLocalizations.of(context)!.home,
      AppLocalizations.of(context)!.favorites,
      AppLocalizations.of(context)!.profile,
    ];
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List<Widget>.generate(
          navBarAssetList.length,
          (index) => CustomNavBarItem(
            path: navBarAssetList.elementAt(index),
            label: titles.elementAt(index),
            tabIndex: index,
          ),
        ).toList(),
      ),
    );
  }
}
