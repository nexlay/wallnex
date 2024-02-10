import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/profile/account_and_login/domain/entities/user.dart';
import 'package:wallnex/features/profile/account_and_login/presentation/page/widgets/account_sliver_scroll_view.dart';
import '../../../../../const/route_paths.dart';
import '../../../../../core/config/l10n/generated/app_localizations.dart';

const avatarSize = 100.00;

class Account extends ProfileScreen {
  const Account({super.key});
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      body: AccountSliverScrollView(
        title: L.of(context).yourInfo,
        childWidget: SliverFillRemaining(
            hasScrollBody: false,
          child: Consumer<LocalUser>(
            builder: (_, user, __) => ProfileScreen(
              avatarSize: avatarSize,
              actions: [
                SignedOutAction(
                  (context) {
                    context.pushReplacement(krLogin);
                  },
                ),
              ],
              children: [
                Column(
                  children: [
                    Text(user.email),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
