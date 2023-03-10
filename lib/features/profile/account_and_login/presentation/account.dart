import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/slivers/custom_scroll_view.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/profile/account_and_login/domain/entities/user.dart';
import 'package:wallnex/features/profile/account_and_login/presentation/provider/local_user_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wallnex/injection_container.dart';

const avatarSize = 100.00;

class Account extends ProfileScreen {
  const Account({Key? key}) : super(key: key);
  @override
  Widget buildPage(BuildContext context) {
    return BodyScrollView(
      actionWidget: IconButton(
        onPressed: () {
          getIt.get<LocalUserProvider>().updateUserPhotoUrl();
        },
        icon: const Icon(Icons.add_a_photo_outlined),
      ),
      title: AppLocalizations.of(context)!.yourInfo,
      childWidget: SliverToBoxAdapter(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Consumer<LocalUser>(
            builder: (_, user, __) => ProfileScreen(
              avatarSize: avatarSize,
              actions: [
                SignedOutAction(
                      (context) {
                    context.pushReplacement(login);
                  },
                ),
              ],
              children: [
                Column(
                  children: [
                    Text(user.email),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery
                          .of(context)
                          .size
                          .height / 7),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
