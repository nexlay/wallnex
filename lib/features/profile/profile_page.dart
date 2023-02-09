import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/profile/account_and_login/domain/entities/user.dart';
import 'package:wallnex/features/profile/widgets/account_item.dart';
import 'package:wallnex/features/profile/widgets/on_page_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Consumer<LocalUser>(
            builder: (_, localUser, __) => AccountItem(
              title: localUser.name.isEmpty
                  ? AppLocalizations.of(context)!.welcome
                  : localUser.name,
              subtitle: localUser.email.isEmpty
                  ? AppLocalizations.of(context)!.creatingAccount
                  : localUser.email,
              path: localUser.isAnonymous ? login : account,
              trailing: localUser.isAnonymous
                  ? null
                  : const UserAvatar(
                      size: 50.0,
                      placeholderColor: Colors.transparent,
                    ),
              leadingIcon: null,
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          ProfilePageItem(
            title: AppLocalizations.of(context)!.appearance,
            subtitle: AppLocalizations.of(context)!.darkTheme,
            path: appearance,
            leadingIcon: const Icon(Icons.dark_mode_outlined),
          ),
          ProfilePageItem(
            title: AppLocalizations.of(context)!.customization,
            subtitle: AppLocalizations.of(context)!.customizationDesc,
            path: customization,
            leadingIcon: const Icon(Icons.dashboard_customize_outlined),
          ),
          ProfilePageItem(
            title: AppLocalizations.of(context)!.appInfo,
            subtitle: AppLocalizations.of(context)!.version,
            path: appInformation,
            leadingIcon: const Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }
}
