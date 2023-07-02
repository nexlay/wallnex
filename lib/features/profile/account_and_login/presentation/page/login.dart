import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/slivers/custom_scroll_view.dart';
import '../../../../../common/ui/animations/animation_with_rive.dart';
import '../../../../../const/const_rive.dart';
import '../../../../../const/route_paths.dart';
import '../../../../../core/config/env/env.dart';
import '../../../../../core/config/l10n/generated/app_localizations.dart';
import '../../../../favorites/presentation/provider/favorites_images_notifier.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyScrollView(
        title:L.of(context).welcome,
        childWidget: SliverFillRemaining(
          hasScrollBody: false,
          child: SignInScreen(
            resizeToAvoidBottomInset: true,
            breakpoint: MediaQuery.of(context).size.height,
            actions: [
              ForgotPasswordAction(
                (context, email) {
                  context.push(krForgotPassword, extra: email);
                },
              ),
              AuthStateChangeAction<SignedIn>(
                (context, state) {
                  if (!state.user!.emailVerified) {
                    context.pushReplacement(krEmailVerification);
                  } else {
                    context
                        .read<FavoritesNotifier>()
                        .getFavorites()
                        .whenComplete(
                          () => context.pushReplacement(krAccount),
                        );
                  }
                },
              ),
              AuthStateChangeAction<UserCreated>(
                (context, state) {
                  if (!state.credential.user!.emailVerified) {
                    context.pushReplacement(krEmailVerification);
                  } else {
                    context.pushReplacement(krAccount);
                  }
                },
              ),
            ],
            headerBuilder: (_, action, shrink) => const AnimationWithRive(
              path: kLogo,
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
