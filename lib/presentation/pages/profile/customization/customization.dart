import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/provider/get_customizartion_notifier.dart';
import '../../../common/ui/slivers/custom_scroll_view.dart';

class Customization extends StatelessWidget {
  const Customization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyScrollView(
        title: 'Customization',
        childWidget1: const SliverToBoxAdapter(),
        childWidget2: const SliverToBoxAdapter(),
        childWidget3: SliverToBoxAdapter(
          child: Column(
            children: [
              ListTile(
                title: const Text('Navigation'),
                subtitle:
                    const Text('Get custom navigation bar with animated icon'),
                trailing: Consumer<GetCustomization>(
                  builder: (_, value, __) => Switch(
                    value: value.switchToCustomNavBar,
                    onChanged: (bool switchTo) {
                      value.setNavBarStyle(!value.switchToCustomNavBar);
                    },
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
