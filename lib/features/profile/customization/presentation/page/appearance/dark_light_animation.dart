import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import '../../../../../../const/const_rive.dart';
import '../../provider/get_theme_notifier.dart';

class DarkLightAnimation extends StatefulWidget {
  const DarkLightAnimation({Key? key}) : super(key: key);

  @override
  State<DarkLightAnimation> createState() => _DarkLightAnimationState();
}

class _DarkLightAnimationState extends State<DarkLightAnimation>
    with WidgetsBindingObserver {
  SMIBool? active;
  late bool themeAnimationActive;

  void onRiveInit(Artboard artboard) async {
    final controller = StateMachineController.fromArtboard(
      artboard,
      stateMachine,
    );
    artboard.addController(controller!);
    active = controller.findInput<bool>(riveSwitch) as SMIBool;
    active?.value = themeAnimationActive;
  }

  @override
  Widget build(BuildContext context) {
    themeAnimationActive =
        context.select((GetThemeNotifier b) => b.themeModeDark);
    active?.value = themeAnimationActive;
    return AspectRatio(
      aspectRatio: 8 / 4,
      child: RiveAnimation.asset(
        lamp,
        onInit: onRiveInit,
      ),
    );
  }
}
