import 'package:flutter/material.dart';


class AccountPageItem extends StatelessWidget {
  const AccountPageItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.widget,

  }) : super(key: key);
  final String title;
  final String subtitle;
  final Widget widget;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => widget,
          ),
        );
      },
    );
  }
}
