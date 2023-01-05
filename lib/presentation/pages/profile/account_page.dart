import 'package:flutter/material.dart';
import 'package:wallnex/presentation/pages/profile/widgets/on_page_item.dart';



import 'about/about.dart';
import 'appearance/appearance.dart';
import 'customization/customization.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const AccountPageItem(
            title: 'Appearance',
            subtitle: 'Dark theme',
            widget: Appearance(),

          ),
          const AccountPageItem(
            title: 'App info',
            subtitle: 'Version',
            widget: AppInformation(),
          ),
          const AccountPageItem(
            title: 'Customization',
            subtitle: 'Change application look',
            widget: Customization(),
          ),
        ],
      ),
    );
  }
}
