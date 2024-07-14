import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/profile/account_and_login/domain/entities/user.dart';
import 'package:wallnex/common/ui/on_page_list_tile.dart';
import 'package:wallnex/features/profile/support/support_development.dart';
import '../../common/ui/premium_user_wrapper.dart';
import '../../const/route_paths.dart';
import '../../core/config/l10n/generated/app_localizations.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Consumer<LocalUser>(
            builder: (_, localUser, __) => Card(

              child: Padding(
                padding: const EdgeInsets.all(kPaddingSize),
                child: OnPageListTile(
                  title: Text(
                      localUser.name.isEmpty ? locale.welcome : localUser.name),
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
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(kPaddingSize),
              child: Column(
                children: [
                  OnPageListTile(
                    title: Text(locale.premium),
                    subtitle: Text(
                      locale.premiumDesc,
                    ),
                    path: krPurchases,
                    leading: const Icon(Icons.workspace_premium),
                  ),
                  OnPageListTile(
                    title: Text(locale.appearance),
                    subtitle: Text(locale.darkTheme),
                    path: krAppearance,
                    leading: const Icon(Icons.dark_mode_outlined),
                  ),
                  PremiumAccessWrapper(
                    alignment: Alignment.centerRight,
                    childWidget: OnPageListTile(
                      title: Text(locale.customization),
                      subtitle: Text(locale.customizationDesc),
                      path: krCustomization,
                      leading: const Icon(Icons.dashboard_customize_outlined),
                    ),
                  ),
                  OnPageListTile(
                    title: Text(locale.subscribe),
                    subtitle: Text(locale.subscribe_desc),
                    path: krDevInfo,
                    leading: const Icon(Icons.new_releases_outlined),
                  ),
                  OnPageListTile(
                    title: Text(locale.appInfo),
                    subtitle: Text(locale.version),
                    path: krAppInformation,
                    leading: const Icon(Icons.info_outline),
                  ),
                ],
              ),
            ),
          ),

          const SupportDev(),
        ],
      ),
    );
  }
}
