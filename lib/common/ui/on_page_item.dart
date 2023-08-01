import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnPageItem extends StatelessWidget {
  const OnPageItem({
    Key? key,
    required this.title,
    required this.subtitle,
    this.path,
    this.leading,
    this.enabled,
  }) : super(key: key);
  final Widget title;
  final Widget subtitle;
  final String? path;
  final Widget? leading;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: enabled == null ? false : false,
      leading: leading,
      title: title,
      subtitle: subtitle,
      onTap: () {
        path != null ? context.push(path!) : null;
      },
    );
  }
}
