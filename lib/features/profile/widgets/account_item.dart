import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallnex/common/ui/on_page_item.dart';

class AccountItem extends OnPageItem {
  const AccountItem({
    super.key,
    required super.title,
    required super.subtitle,
    required super.path,
    required this.trailing,
    required super.leading,
  });

  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading: leading,
      trailing: trailing,
      title: title,
      subtitle: subtitle,
      onTap: () {
        context.push(path!);
      },
    );
  }
}
