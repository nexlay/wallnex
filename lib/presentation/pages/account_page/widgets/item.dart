import 'package:flutter/material.dart';
import '../about_wallnex_page.dart';

class AccountPageItem extends StatelessWidget {
  const AccountPageItem({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const WelcomeWallnexPage(),
          ),
        );
      },
    );
  }
}
