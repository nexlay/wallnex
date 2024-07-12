import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';

class OnPageListTile extends StatelessWidget {
  const OnPageListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.isThreeLine,
    this.path,
    this.leading,
    this.enabled,
    this.wallpaper,
  });
  final Widget title;
  final Widget? subtitle;
  final bool? isThreeLine;
  final String? path;
  final Widget? leading;
  final bool? enabled;
  final Wallpaper? wallpaper;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: enabled == null ? true : false,
      leading: leading,
      title: title,
      subtitle: subtitle,
      onTap: () {
        path != null ? context.push(path!, extra: wallpaper) : null;
      },
    );
  }
}
