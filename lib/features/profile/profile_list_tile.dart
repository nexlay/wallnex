import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallnex/common/ui/on_page_list_tile.dart';

class ProfileListTile extends OnPageListTile {
  const ProfileListTile({
    super.key,
    required super.title,
    super.subtitle,
    super.path,
    this.trailing,
    required this.isCenter,
    super.leading,
    super.enabled,
  });

  final Widget? trailing;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: enabled == null ? true : false,
      leading: leading,
      trailing: trailing,
      title: isCenter ? Center(child: title) : title,
      subtitle: isCenter ? Center(child: subtitle) : subtitle,
      onTap: () {
        context.push(path!);
      },
    );
  }
}
