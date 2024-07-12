import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallnex/common/ui/on_page_list_tile.dart';

class ProfileListTile extends OnPageListTile {
  const ProfileListTile({
    super.key,
    required super.title,
    super.subtitle,
    super.isThreeLine,
    super.path,
    this.trailing,
    required this.isCenter,
    this.elevation,
    super.leading,
    super.enabled,
  });

  final Widget? trailing;
  final bool isCenter;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: ListTile(
        enabled: enabled ?? true,
        isThreeLine: isThreeLine ?? false,
        leading: leading,
        trailing: trailing,
        title: isCenter ? Center(child: title) : title,
        subtitle: isCenter ? Center(child: subtitle) : subtitle,
        onTap: () {
          context.push(path!);
        },
      ),
    );
  }
}
