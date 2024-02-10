import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../common/ui/animations/animation_with_rive.dart';
import '../../../../../const/const_rive.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordScreen(
      email: email,
      headerMaxExtent: 200,
      headerBuilder: (_, constraints, shrinkOffset) => const Center(
        child: AnimationWithRive(
          path: kLock,
        ),
      ),
    );
  }
}
