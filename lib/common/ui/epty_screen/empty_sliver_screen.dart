import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:wallnex/const/const.dart';

class EmptySliverScreen extends StatelessWidget {
  const EmptySliverScreen(
      {Key? key,
      required this.assetPath,
      required this.title,
      required this.subtitle})
      : super(key: key);

  final String assetPath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
           AspectRatio(
            aspectRatio: 2 / 1,
            child: RiveAnimation.asset(
              assetPath,
            ),
          ),
          ListTile(
            title: Center(
              child: Text(
               title,
                style: const TextStyle(fontSize: kFontSize),
              ),
            ),
            subtitle: Center(
              child: Text(subtitle),
            ),
          ),
        ],
      ),
    );
  }
}
