import 'package:flutter/material.dart';
import 'package:wallnex/features/profile/widgets/account_item.dart';
import 'package:wallnex/features/profile/widgets/on_page_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'account/presentation/account.dart';
import 'app_info/presentation/page/about/about.dart';
import 'customization/presentation/page/appearance/appearance.dart';
import 'customization/presentation/page/customization/customization.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const AccountItem(
              title: 'Mykola Pryhodskyi',
              subtitle: 'pryhodskyimykola@gmail.com',
              widget: Account(),
            trailing: Icon(Icons.account_circle),
          ),
          ProfilePageItem(
            title: AppLocalizations.of(context)!.appearance,
            subtitle: AppLocalizations.of(context)!.darkTheme,
            widget: const Appearance(),
          ),
          ProfilePageItem(
            title: AppLocalizations.of(context)!.appInfo,
            subtitle: AppLocalizations.of(context)!.version,
            widget: const AppInformation(),
          ),
          ProfilePageItem(
            title: AppLocalizations.of(context)!.customization,
            subtitle: AppLocalizations.of(context)!.customizationDesc,
            widget: const Customization(),
          ),
        ],
      ),
    );
  }
}
