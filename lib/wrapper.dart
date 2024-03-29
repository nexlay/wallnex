import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/profile/customization/presentation/provider/customization_provider.dart';
import 'common/ui/buttons/floating_buttons_bar.dart';
import 'common/ui/navigation_bar/custom_nav_bar.dart';
import 'common/ui/navigation_bar/provider/get_default_home_page_notifier.dart';
import 'common/ui/slivers/custom_scroll_view.dart';
import 'const/const.dart';
import 'core/config/l10n/generated/app_localizations.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);

    final List<NavigationDestination> navDestinations = [
      NavigationDestination(
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        label: locale.home,
      ),
      NavigationDestination(
        icon: const Icon(Icons.favorite_border),
        selectedIcon: const Icon(Icons.favorite),
        label: locale.favorites,
      ),
      NavigationDestination(
        icon: const Icon(Icons.account_circle_outlined),
        selectedIcon: const Icon(Icons.account_circle),
        label: locale.profile,
      ),
    ];

    final titles = [
      locale.home,
      locale.favorites,
      locale.profile,
    ];

    final pageIndex = context.select((GetPages i) => i.value);
    final customNavBar = context.select((CustomizationProvider c) => c.customNavBar);

    return Scaffold(
      floatingActionButton: pageIndex == 0 ? const FloatingButtonsBar() : null,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      bottomNavigationBar: customNavBar
          ? const CustomNavBar()
          : NavigationBar(
              animationDuration: const Duration(milliseconds: 100),
              destinations: navDestinations,
              onDestinationSelected: (index) =>
                  context.read<GetPages>().value = index,
              selectedIndex: pageIndex,
            ),
      body: BodyScrollView(
        title: titles.elementAt(pageIndex),
        childWidget: kPagesList.elementAt(pageIndex),
      ),
    );
  }
}
