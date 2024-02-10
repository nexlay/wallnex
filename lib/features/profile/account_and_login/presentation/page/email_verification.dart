import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallnex/common/ui/animations/animation_with_rive.dart';
import '../../../../../const/const_rive.dart';
import '../../../../../const/route_paths.dart';


class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return EmailVerificationScreen(
      headerBuilder: (_, constraints, shrink) =>
          const AnimationWithRive(path: kDone,),
      actions: [
        EmailVerifiedAction(() {
          context.pushReplacement(krAccount);
        }),
        AuthCancelledAction((context) {
          FirebaseUIAuth.signOut(context: context);
        context.pushNamed(krLogin);
        }),
      ],
    );
  }
}
