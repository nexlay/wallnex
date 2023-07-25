import 'package:flutter/material.dart';
import 'package:wallnex/common/ui/on_page_item.dart';

class OnPopUpSpecsMenuItem extends OnPageItem {
  const OnPopUpSpecsMenuItem({
    super.key,
    required super.title,
    required super.subtitle,
    required super.path,
    required super.leading,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      subtitle: Text(
        text,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
