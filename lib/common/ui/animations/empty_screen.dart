import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen(
      {Key? key,
      required this.animations,
      required this.assetPath,
      required this.title,
      required this.subtitle})
      : super(key: key);

  final List<String> animations;
  final String assetPath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
         AspectRatio(
          aspectRatio: 8 / 4,
          child: RiveAnimation.asset(
            assetPath,
            animations: animations,
          ),
        ),
        ListTile(
          title: Center(
            child: Text(
             title,
              style: const TextStyle(fontSize: 20.0),
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
