import 'package:flutter/material.dart';
import 'package:wallnex/common/ui/on_page_list_tile.dart';

class OnPopUpSpecsMenuItem extends OnPageListTile {
  const OnPopUpSpecsMenuItem({
    super.key,
    required super.title,
    super.subtitle,
    super.path,
    required super.leading,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: false,
      leading: leading,
      title: title,
      subtitle: Text(
        text,
        style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
    );
  }
}
