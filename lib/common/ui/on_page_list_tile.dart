import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';

class OnPageListTile extends StatelessWidget {
  const OnPageListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.isThreeLine = false,
    this.path,
    this.leading,
    this.trailing,
    this.enabled = true,
    this.wallpaper,
    this.centerContent = false,
  });

  final Widget title;
  final Widget? subtitle;
  final bool isThreeLine;
  final String? path;
  final Widget? leading;
  final Widget? trailing;
  final bool enabled;
  final Wallpaper? wallpaper;
  final bool centerContent;

  @override
  Widget build(BuildContext context) {
    final titleWidget = centerContent ? Center(child: title) : title;
    final subtitleWidget = centerContent ? Center(child: subtitle) : subtitle;

    return ListTile(
      enabled: enabled,
      leading: leading,
      trailing: trailing,
      title: titleWidget,
      subtitle: subtitleWidget,
      isThreeLine: isThreeLine,
      onTap: enabled
          ? () {
              if (path != null) {
                context.push(path!, extra: wallpaper);
              }
            }
          : null,
    );
  }
}
