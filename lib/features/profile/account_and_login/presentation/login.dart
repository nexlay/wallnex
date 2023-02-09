import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:wallnex/common/ui/slivers/custom_scroll_view.dart';
import 'package:wallnex/const/const.dart';
import '../../../../common/ui/animations/animation_with_rive.dart';
import '../../../../const/const_rive.dart';
import '../../../../core/config/env/env.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyScrollView(
      title: AppLocalizations.of(context)!.welcome,
      actionWidget: null,
      childWidget: SliverToBoxAdapter(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                    context.pushReplacement(account);
                  }
                },
              ),
              AuthStateChangeAction<UserCreated>(
                (context, state) {
                  if (!state.credential.user!.emailVerified) {
                    context.pushReplacement(emailVerification);
                  } else {
                    context.pushReplacement(accounts);
                  }
                },
              ),
            ],
            headerBuilder: (_, action, shrink) => const AnimationWithRive(
              path: logo,
            ),
            subtitleBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.only(top: 32.0),
              );
            },
            oauthButtonVariant: OAuthButtonVariant.icon,
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
