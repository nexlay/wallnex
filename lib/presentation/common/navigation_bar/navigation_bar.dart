import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../const.dart';
import '../../pages/home_page/widgets/categories_header.dart';
import '../../provider/get_navBar_page_notifier.dart';
import '../floating_page_buttons_bar.dart';
import '../slivers/custom_scroll_view.dart';

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

class WallnexNavBar extends StatelessWidget {
  const WallnexNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final page = context.select(
      (GetPages p) => p.getPage(),
    );
    final label = context.select((GetPages l) => l.getLabel());
    final pageIndex = context.select((GetPages i) => i.getIndex);
    return Scaffold(
      floatingActionButton: Visibility(
        visible: pageIndex == 0 ? true : false,
        child: const FloatingButtonsBar(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 1),
        destinations: List<NavigationDestination>.generate(
          _navDestinations.length,
          (index) => _navDestinations[index],
        ),
        onDestinationSelected: (int index) {
          context.read<GetPages>().setIndex = index;
        },
        selectedIndex: pageIndex,
      ),
      body: BodyScrollView(
        title: label,
        childWidget1: pageIndex == 0
            ? const CategoriesHeader()
            : const SliverToBoxAdapter(),
        childWidget2: page,
      ),
    );
  }
}
