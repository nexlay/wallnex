import 'package:flutter/material.dart';
import 'package:wallnex/const/const.dart';
import '../../../core/config/l10n/generated/app_localizations.dart';
import 'custom_nav_bar_item.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final titles = [
      L.of(context).categories,
      L.of(context).home,
      L.of(context).favorites,
      L.of(context).profile,
    ];

    return SizedBox(
      height: 110,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: kAppPadding,
          child: Card(
            child: Padding(
              padding: kAppPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List<Widget>.generate(
                  kNavBarIcons.length,
                  (index) => CustomNavBarItem(
                    icon: kNavBarIcons.elementAt(index),
                    label: titles.elementAt(index),
                    tabIndex: index,
                    filledIcon: kNavBarFilledIcons.elementAt(index),
                  ),
                ).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
