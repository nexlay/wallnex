import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/slivers/custom_scroll_view.dart';
import 'package:wallnex/const/const.dart';
import '../../../../../common/ui/animations/animation_with_rive.dart';
import '../../../../../const/const_rive.dart';
import '../../../../../core/config/env/env.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../favorites/presentation/provider/favorites_images_notifier.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyScrollView(
        title: AppLocalizations.of(context)!.welcome,
        actionWidget: null,
        childWidget: SliverFillRemaining(
          hasScrollBody: false,
          child: SignInScreen(
            resizeToAvoidBottomInset: true,
            breakpoint: MediaQuery.of(context).size.height,
            actions: [
              ForgotPasswordAction(
                (context, email) {
                  context.push(forgotPassword, extra: email);
                },
              ),
              AuthStateChangeAction<SignedIn>(
                (context, state) {
                  if (!state.user!.emailVerified) {
                    context.pushReplacement(emailVerification);
                  } else {
                    context
                        .read<FavoritesNotifier>()
                        .getFavorites()
                        .whenComplete(
                          () => context.pushReplacement(account),
                        );
                  }
                },
              ),
              AuthStateChangeAction<UserCreated>(
                (context, state) {
                  if (!state.credential.user!.emailVerified) {
                    context.pushReplacement(emailVerification);
                  } else {
                    context.pushReplacement(account);
                  }
                },
              ),
            ],
            headerBuilder: (_, action, shrink) => const AnimationWithRive(
              path: logo,
            ),
            oauthButtonVariant: OAuthButtonVariant.icon_and_text,
            providers: [
              EmailAuthProvider(),
              GoogleProvider(clientId: Env.googleClientId),
            ],
          ),
        ),
      ),
    );
  }
}
