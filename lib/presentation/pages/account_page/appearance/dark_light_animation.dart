import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import '../../../../const.dart';
import '../../../provider/get_theme_notifier.dart';

class DarkLightAnimation extends StatefulWidget {
  const DarkLightAnimation({Key? key}) : super(key: key);

  @override
  State<DarkLightAnimation> createState() => _DarkLightAnimationState();
}

class _DarkLightAnimationState extends State<DarkLightAnimation> {
  SMIBool? active;
  late bool themeAnimationActive;
  String? themeValue;

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
  void didChangeDependencies() {
    context.read<GetThemeNotifier>().checkThemeMode();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    themeAnimationActive =
        context.select((GetThemeNotifier b) => b.themeModeDark);
    active?.value = themeAnimationActive;
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width / 1.5,
      child: RiveAnimation.asset(
        lamp,
        onInit: onRiveInit,
      ),
    );
  }
}
