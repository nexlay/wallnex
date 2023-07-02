import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class OnListItem extends StatelessWidget {
  const OnListItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.path,
    required this.leading,
  }) : super(key: key);
  final Widget title;
  final Widget subtitle;
  final String path ;
  final Widget? leading;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      onTap: () {
       context.push(path);
      },
    );
  }
}
