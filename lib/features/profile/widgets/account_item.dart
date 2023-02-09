import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallnex/features/profile/widgets/on_page_item.dart';

class AccountItem extends ProfilePageItem {
  const AccountItem({
    super.key,
    required super.title,
    required super.subtitle,
    required super.path,
    required this.trailing,
    required super.leadingIcon,
  });

  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: trailing,
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        context.push(path);
      },
    );
  }
}
