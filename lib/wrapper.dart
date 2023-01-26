import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/provider/get_default_home_page_notifier.dart';
import 'common/ui/navigation_bar/custom_nav_bar.dart';
import 'common/ui/slivers/custom_scroll_view.dart';
import 'const/const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'features/profile/customization/presentation/provider/get_customization_notifier.dart';

class Warapper extends StatelessWidget {
  const Warapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<NavigationDestination> navDestinations = [
      NavigationDestination(
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        label: AppLocalizations.of(context)!.home,
      ),
      NavigationDestination(
        icon: const Icon(Icons.favorite_border),
        selectedIcon: const Icon(Icons.favorite),
        label: AppLocalizations.of(context)!.favorites,
      ),
      NavigationDestination(
        icon: const Icon(Icons.account_circle_outlined),
        selectedIcon: const Icon(Icons.account_circle),
        label: AppLocalizations.of(context)!.profile,
      ),
    ];

    final titles = [
      AppLocalizations.of(context)!.home,
      AppLocalizations.of(context)!.favorites,
      AppLocalizations.of(context)!.profile,
    ];

    final pageIndex = context.select((GetPages i) => i.value);
    final customNavBar = context.select((GetCustomization c) => c.value);
    return Scaffold(
      bottomNavigationBar: customNavBar
          ? const CustomNavBar()
          : NavigationBar(
              animationDuration: const Duration(seconds: 1),
              destinations: navDestinations,
              onDestinationSelected: (index) =>
                  context.read<GetPages>().value = index,
              selectedIndex: pageIndex,
            ),
      body: BodyScrollView(
        title: titles[pageIndex],
        childWidget: pagesList[pageIndex],
      ),
    );
  }
}
