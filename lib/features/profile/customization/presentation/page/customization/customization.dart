import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../common/ui/slivers/custom_scroll_view.dart';
import '../../provider/get_customization_notifier.dart';

class Customization extends StatelessWidget {
  const Customization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyScrollView(
        title: AppLocalizations.of(context)!.customization,
        actionWidget: null,
        childWidget: SliverToBoxAdapter(
          child: Column(
            children: [
              ListTile(
                title: Text(AppLocalizations.of(context)!.navigation),
                subtitle:
                    Text(AppLocalizations.of(context)!.navigationDesc),
                trailing: Consumer<GetCustomization>(
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
