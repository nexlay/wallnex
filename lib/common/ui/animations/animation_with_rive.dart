import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../const/const_rive.dart';

class AnimationWithRive extends StatelessWidget {
  const AnimationWithRive({Key? key, required this.path, required this.onRiveInit}) : super(key: key);

  final String path;
  final Function(Artboard)? onRiveInit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width,
      child: RiveAnimation.asset(
        path,
        stateMachines: const [kStateMachine],
        onInit: onRiveInit,
      ),
    );
  }
}
