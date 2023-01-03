import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/common/ui/navigation_bar/custom_nav_bar.dart';
import 'package:wallnex/presentation/common/ui/slivers/custom_scroll_view.dart';
import 'package:wallnex/presentation/pages/home/widgets/categories_header.dart';
import 'package:wallnex/presentation/pages/home/widgets/search.dart';
import 'package:wallnex/presentation/provider/get_customizartion_notifier.dart';
import 'const.dart';
import 'presentation/provider/get_default_home_page_notifier.dart';
import 'presentation/common/ui/floating_page_buttons_bar.dart';

final List<NavigationDestination> _navDestinations = [
  NavigationDestination(
    icon: const Icon(Icons.home_outlined),
    selectedIcon: const Icon(Icons.home),
    label: labelList[0],
  ),
  NavigationDestination(
    icon: const Icon(Icons.favorite_border),
    selectedIcon: const Icon(Icons.favorite),
    label: labelList[1],
  ),
  NavigationDestination(
    icon: const Icon(Icons.account_circle_outlined),
    selectedIcon: const Icon(Icons.account_circle),
    label: labelList[2],
  ),
];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<GetPages, Tuple3<Widget, String, int>>(
      selector: (_, provider) =>
          Tuple3(provider.getPage(), provider.getLabel(), provider.index),
      builder: (_, value, __) => Scaffold(
        floatingActionButton: Visibility(
          visible: value.value3 == 0 ? true : false,
          child: const FloatingButtonsBar(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar:
            Selector<GetCustomization, Tuple3<bool, String, bool>>(
          selector: (_, provider) => Tuple3(
              provider.loading, provider.error, provider.switchToCustomNavBar),
          builder: (_, customization, __) => customization.value3
              ? const CustomNavBar()
              : NavigationBar(
                  animationDuration: const Duration(seconds: 1),
                  destinations: List<NavigationDestination>.generate(
                    _navDestinations.length,
                    (index) => _navDestinations[index],
                  ),
                  onDestinationSelected: (int index) {
                    context.read<GetPages>().currentIndex = index;
                  },
                  selectedIndex: value.value3,
                ),
        ),
        body: BodyScrollView(
          title: value.value2,
          childWidget1: value.value3 == 0
              ? const CategoriesHeader()
              : const SliverToBoxAdapter(),
          childWidget2:
              value.value3 == 0 ? const Search() : const SliverToBoxAdapter(),
          childWidget3: value.value1,
        ),
      ),
    );
  }
}
