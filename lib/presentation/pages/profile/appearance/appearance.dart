import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const.dart';
import '../../../common/ui/slivers/custom_scroll_view.dart';
import '../../../provider/get_theme_notifier.dart';
import 'dark_light_animation.dart';

const List themeNavBar = [
  NavigationDestination(
    icon: Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(Icons.auto_awesome_outlined),
    ),
    selectedIcon: Icon(Icons.auto_awesome),
    label: 'Auto',
  ),
  NavigationDestination(
      icon: Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.light_mode_outlined),
      ),
      selectedIcon: Icon(Icons.light_mode),
      label: 'Light'),
  NavigationDestination(
      icon: Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.dark_mode_outlined),
      ),
      selectedIcon: Icon(Icons.dark_mode),
      label: 'Dark'),
];

class Appearance extends StatelessWidget {
  const Appearance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int themeValue = context.select((GetThemeNotifier t) => t.value);

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50.0, right: 16.0, left: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: NavigationBar(
            selectedIndex: themeValue,
            onDestinationSelected: (index) {
              context.read<GetThemeNotifier>().setThemeValue(index);
            },
            destinations: List.generate(
              themeNavBar.length,
              (index) => themeNavBar[index],
            ),
          ),
        ),
      ),
      body: BodyScrollView(
        title: themeLabel,
        childWidget1: const SliverToBoxAdapter(),
        childWidget2: const SliverToBoxAdapter(),
        childWidget3: SliverToBoxAdapter(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  themePageText,
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height / 6),
                  child: const DarkLightAnimation()),
            ],
          ),
        ),
      ),
    );
  }
}
