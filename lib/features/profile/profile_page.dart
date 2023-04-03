import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/profile/account_and_login/domain/entities/user.dart';
import 'package:wallnex/features/profile/widgets/account_item.dart';
import 'package:wallnex/features/profile/widgets/on_page_item.dart';
import '../../core/config/l10n/generated/app_localizations.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Consumer<LocalUser>(
            builder: (_, localUser, __) => AccountItem(
              title: Text(localUser.name.isEmpty
                  ? locale.welcome
                  : localUser.name),
              subtitle: Text(localUser.email.isEmpty
                  ? locale.creatingAccount
                  : localUser.email),
              path: localUser.isAnonymous ? krLogin : krAccount,
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
            title: Text(locale.appearance),
            subtitle: Text(locale.darkTheme),
            path: krAppearance,
            leading: const Icon(Icons.dark_mode_outlined),
          ),
          ProfilePageItem(
            title: Text(locale.customization),
            subtitle: Text(locale.customizationDesc),
            path: krCustomization,
            leading: const Icon(Icons.dashboard_customize_outlined),
          ),
          ProfilePageItem(
            title: Text(locale.appInfo),
            subtitle: Text(locale.version),
            path: krAppInformation,
            leading: const Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }
}
