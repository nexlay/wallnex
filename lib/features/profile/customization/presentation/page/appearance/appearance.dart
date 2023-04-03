import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../common/ui/animations/animation_with_rive.dart';
import '../../../../../../common/ui/slivers/custom_scroll_view.dart';
import '../../../../../../const/const_rive.dart';
import '../../../../../../core/config/l10n/generated/app_localizations.dart';
import '../../provider/theme_provider.dart';

class Appearance extends StatelessWidget {
  const Appearance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);
    final themeNavBar = [
      NavigationDestination(
        icon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.auto_awesome_outlined),
        ),
        selectedIcon: const Icon(Icons.auto_awesome),
        label: locale.auto,
      ),
      NavigationDestination(
          icon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.light_mode_outlined),
          ),
          selectedIcon: const Icon(Icons.light_mode),
          label: locale.light),
      NavigationDestination(
          icon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.dark_mode_outlined),
          ),
          selectedIcon: const Icon(Icons.dark_mode),
          label: locale.dark),
    ];

    ThemeValue themeValue = context.select((ThemeProvider t) => t.value);

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50.0, right: 16.0, left: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: NavigationBar(
            selectedIndex: themeValue.value,
            onDestinationSelected: (index) =>
                context.read<ThemeProvider>().setThemeValue(index),
            destinations: themeNavBar,
          ),
        ),
      ),
      body: BodyScrollView(
        title: L.of(context).theme,
        actionWidget: null,
        childWidget: SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              children: [
                Text(
                  L.of(context).themeDesc,
                  textAlign: TextAlign.justify,
                ),
                Align(
                  alignment: Alignment.center,
                  child: AnimationWithRive(
                    path: kLamp,
                    onRiveInit: context.read<ThemeProvider>().onRiveInit,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
