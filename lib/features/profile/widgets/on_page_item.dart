import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ProfilePageItem extends StatelessWidget {
  const ProfilePageItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.path,
    required this.leadingIcon,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final String path ;
  final Icon? leadingIcon;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon,
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
       context.push(path);
      },
    );
  }
}
