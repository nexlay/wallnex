import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:wallnex/common/ui/on_page_list_tile.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen(
      {super.key,
      required this.assetPath,
      required this.title,
      required this.subtitle});

  final String assetPath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: RiveAnimation.asset(
            assetPath,
          ),
        ),
        OnPageListTile(
          enabled: false,
          title: Center(
            child: Text(
              title,
            ),
          ),
          subtitle: Center(
            child: Text(subtitle),
          ),
        ),
      ],
    );
  }
}
