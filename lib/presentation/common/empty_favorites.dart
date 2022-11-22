import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:wallnex/const.dart';


class EmptyFavorites extends StatelessWidget {
  const EmptyFavorites({Key? key}) : super(key: key);

  void onRiveInit(Artboard artboard) async {
    final controller = StateMachineController.fromArtboard(
      artboard,
      stateMachine,
    );
    artboard.addController(controller!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 2,
          child: RiveAnimation.asset(
            emptyFavorites,
            onInit: onRiveInit,
          ),
        ),
        const Text(
          'No favorites yet!',
          style: TextStyle(fontSize: 26.0),
        ),
        const Text("Once you favorite an image, you'll see it here."),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
