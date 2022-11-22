import 'package:flutter/material.dart';
import 'package:wallnex/presentation/pages/account_page/widgets/item.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const AccountPageItem(
            title: 'App info',
            subtitle: 'Version',
          ),
        ],
      ),
    );
  }
}
