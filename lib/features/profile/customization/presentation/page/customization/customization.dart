import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/profile/customization/presentation/provider/customization_provider.dart';
import '../../../../../../common/ui/slivers/custom_scroll_view.dart';
import '../../../../../../core/config/l10n/generated/app_localizations.dart';


class Customization extends StatelessWidget {
  const Customization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);
    return Scaffold(
      body: BodyScrollView(
        title: locale.customization,
        actionWidget: null,
        childWidget: SliverToBoxAdapter(
          child: Column(
            children: [
              ListTile(
                title: Text(locale.navigation),
                subtitle:
                    Text(locale.navigationDesc),
                trailing: Consumer<CustomizationProvider>(
                  builder: (_, value, __) => Switch(
                    value: value.value,
                    onChanged: (bool switchTo) {
                      value.setNavBarStyle(switchTo);
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
