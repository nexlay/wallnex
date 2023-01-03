import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:wallnex/const.dart';

class EmptyFavorites extends StatelessWidget {
  const EmptyFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: const [
        AspectRatio(
          aspectRatio: 8 / 4,
          child: RiveAnimation.asset(
            emptyFavorites,
            animations: [
              'image',
              'animate',
            ],
          ),
        ),
        ListTile(
          title: Center(
            child: Text(
              'No favorites yet!',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          subtitle: Center(
              child: Text("Once you favorite an image, you'll see it here.")),
        ),
      ],
    );
  }
}
