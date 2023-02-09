import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallnex/common/ui/slivers/custom_scroll_view.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/file_manager/presentation/provider/file_manager_notifier.dart';
import 'package:wallnex/features/profile/account_and_login/presentation/provider/user_auth_change_notifier.dart';
import 'package:wallnex/injection_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Account extends ProfileScreen {
  const Account({Key? key}) : super(key: key);
  @override
  Widget buildPage(BuildContext context) {
    return BodyScrollView(
      actionWidget: IconButton(
        onPressed: () {
          getIt.get<FileManagerNotifier>().getFileFromGallery().then(
              (value) => getIt.get<UserAuthChangeNotifier>().getUrl(value!));
        },
        icon: const Icon(Icons.add_a_photo_outlined),
      ),
      title: AppLocalizations.of(context)!.yourInfo,
      childWidget: SliverToBoxAdapter(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ProfileScreen(
            avatarPlaceholderColor: Colors.transparent,
            avatarSize: 100,
            actions: [
              SignedOutAction(
                (context) {
                  context.pushReplacement(login);
                },
              ),
            ],
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height / 7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
