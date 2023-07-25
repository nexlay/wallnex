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
  var brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;


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
    final themeNavBarWithPremium = [
      NavigationDestination(
        icon: const Icon(Icons.auto_awesome_outlined),
        selectedIcon: const Icon(Icons.auto_awesome),
        label: locale.auto,
      ),
      NavigationDestination(
          icon: const Icon(Icons.light_mode_outlined),
          selectedIcon: const Icon(Icons.light_mode),
          label: locale.light),
      NavigationDestination(
          icon: const Icon(Icons.dark_mode_outlined),
          selectedIcon: const Icon(Icons.dark_mode),
          label: locale.dark),
    ];


    return Scaffold(
      bottomNavigationBar: Consumer<ThemeProvider>(
        builder: (_, themeProvider, __) {
          themeValue = themeProvider.value;
          //Check on theme changed
          activateAnimation();
          return NavigationBar(
            selectedIndex: themeProvider.value.value,
            onDestinationSelected: (index) =>
                context.read<ThemeProvider>().setThemeValue(index),
            destinations:
                themeNavBarWithPremium,
          );
        },
      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
