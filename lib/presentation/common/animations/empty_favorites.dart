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
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 1.7,
          child: const RiveAnimation.asset(
            emptyFavorites,
            animations: [
              'image',
              'animate',
            ],
          ),
        ),
        const ListTile(
          title: Center(
            child: Text(
              'No favorites yet!',
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          subtitle: Center(
              child: Text("Once you favorite an image, you'll see it here.")),
        ),
      ],
    );
  }
}
