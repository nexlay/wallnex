import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import '../../../../../../common/ui/slivers/custom_scroll_view.dart';
import '../../../../../../const/const_rive.dart';
import '../../../../../../core/config/l10n/generated/app_localizations.dart';
import '../../provider/theme_provider.dart';

class Appearance extends StatefulWidget {
  const Appearance({Key? key}) : super(key: key);

  @override
  State<Appearance> createState() => _AppearanceState();
}

class _AppearanceState extends State<Appearance> {
  //Trigger for activating rive animation
  SMIBool? _activateRiveAnimation;
  ThemeValue themeValue = ThemeValue.auto;
  var brightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  void onRiveInit(Artboard artboard) async {
    final controller = StateMachineController.fromArtboard(
      artboard,
      kStateMachine,
    );
    artboard.addController(controller!);
    _activateRiveAnimation = controller.findInput<bool>(kRiveSwitch) as SMIBool;
    //Check on animation init
    activateAnimation();
  }

  void activateAnimation() {
    _activateRiveAnimation?.value = themeValue.value == 0
        ? brightness == Brightness.dark
        : themeValue.value == 1
            ? false
            : themeValue.value == 2
                ? true
                : false;
  }

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);

    return Scaffold(
      body: BodyScrollView(
        title: locale.theme,
        childWidget: SliverFillRemaining(
          child: Stack(
            children: [
              Text(
                locale.themeDesc,
                textAlign: TextAlign.justify,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: RiveAnimation.asset(
                    kLamp,
                    onInit: onRiveInit,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 13,
                child: Consumer<ThemeProvider>(
                  builder: (_, themeProvider, __) {
                    themeValue = themeProvider.value;
                    //Check on theme changed
                    activateAnimation();
                    return SegmentedButton<int>(
                      segments: <ButtonSegment<int>>[
                        ButtonSegment<int>(
                          value: ThemeValue.auto.value,
                          icon: const Icon(Icons.auto_awesome_outlined),
                          label: Text(locale.auto),
                        ),
                        ButtonSegment<int>(
                          icon: const Icon(Icons.light_mode_outlined),
                          value: ThemeValue.light.value,
                          label: Text(locale.light),
                        ),
                        ButtonSegment<int>(
                          icon: const Icon(Icons.dark_mode_outlined),
                          value: ThemeValue.dark.value,
                          label: Text(locale.dark),
                        ),
                      ],
                      selected: <int>{themeProvider.value.value},
                      onSelectionChanged: (Set<int> newSelection) {
                        themeProvider.setThemeValue(newSelection.first);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
