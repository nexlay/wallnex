import 'package:flutter/material.dart';
import 'package:wallnex/features/profile/widgets/on_page_item.dart';

class AccountItem extends ProfilePageItem {
  const AccountItem(
      {super.key,
      required super.title,
      required super.subtitle,
      required super.widget,
      required this.trailing});

  final Icon trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: trailing,
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
