import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/profile/customization/presentation/provider/customization_provider.dart';
import '../../../../../../common/ui/slivers/custom_scroll_view.dart';
import '../../../../../../core/config/l10n/generated/app_localizations.dart';

class Customization extends StatelessWidget {
  const Customization({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);
    return Scaffold(
      body: BodyScrollView(
        title: locale.customization,
        childWidget: SliverToBoxAdapter(
          child: Consumer<CustomizationProvider>(
            builder: (_, value, __) => Column(
              children: [
                ListTile(
                  title: Text(locale.navigation),
                  subtitle: Text(locale.navigationDesc),
                  trailing: Switch(
                    value: value.customNavBar,
                    onChanged: (bool switchTo) {
                      value.setNavBarStyle(switchTo);
                    },
                  ),
                ),
                ListTile(
                  title: Text(locale.gridCount,),
                  subtitle: Text(locale.gridCountDesc),
                  trailing: Switch(
                    value: value.crossAxisCount,
                    onChanged: (bool switchTo) {
                      value.setCrossAxisCount(switchTo);
                    },
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
