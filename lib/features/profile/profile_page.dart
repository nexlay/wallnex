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
              title: Text(localUser.name.isEmpty
                  ? AppLocalizations.of(context)!.welcome
                  : localUser.name),
              subtitle: Text(localUser.email.isEmpty
                  ? AppLocalizations.of(context)!.creatingAccount
                  : localUser.email),
              path: localUser.isAnonymous ? login : account,
              trailing: localUser.isAnonymous && localUser.photoUrl.isNotEmpty
                  ? null
                  : const UserAvatar(
                      size: 50.0,
                      placeholderColor: Colors.transparent,
                    ),
              leading: null,
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          ProfilePageItem(
            title: Text(AppLocalizations.of(context)!.appearance),
            subtitle: Text(AppLocalizations.of(context)!.darkTheme),
            path: appearance,
            leading: const Icon(Icons.dark_mode_outlined),
          ),
          ProfilePageItem(
            title: Text(AppLocalizations.of(context)!.customization),
            subtitle: Text(AppLocalizations.of(context)!.customizationDesc),
            path: customization,
            leading: const Icon(Icons.dashboard_customize_outlined),
          ),
          ProfilePageItem(
            title: Text(AppLocalizations.of(context)!.appInfo),
            subtitle: Text(AppLocalizations.of(context)!.version),
            path: appInformation,
            leading: const Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }
}
