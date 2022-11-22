
import 'package:flutter/material.dart';
import '../../../const.dart';
import '../../provider/get_home_page_notifier.dart';
import '../slivers/custom_scroll_view.dart';
import 'custom_nav_bar_item.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final page = context.select((Pages p) => p.getPage(),);
    final label = context.select((Pages l) => l.getLabel());
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 96,
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
      ),
      body: BodyScrollView(title: label, childWidget: page,),
    );
  }
}
