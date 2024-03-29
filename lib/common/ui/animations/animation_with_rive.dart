import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimationWithRive extends StatelessWidget {
  const AnimationWithRive({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width,
      child: RiveAnimation.asset(
        path,
      ),
    );
  }
}
