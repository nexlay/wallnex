import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/slivers/custom_scroll_view.dart';
import 'package:wallnex/features/profile/account_and_login/presentation/provider/local_user_provider.dart';
import '../../../../../const/route_paths.dart';
import '../../../../../core/config/env/env.dart';
import '../../../../../core/config/l10n/generated/app_localizations.dart';
import '../../../../favorites/presentation/provider/favorites_images_notifier.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

class CustomLoginScreen extends StatelessWidget {
  const CustomLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyScrollView(
        title: L.of(context).welcome,
        childWidget: SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: L.of(context).email,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: L.of(context).password,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle login
                  },
                  child: Text(L.of(context).login),
                ),
                const SizedBox(height: 16),
                GoogleSignInButton(
                  clientId: Env.googleClientId,
                  loadingIndicator: const CircularProgressIndicator(),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    context.push(krForgotPassword);
                  },
                  child: Text(L.of(context).forgotPassword),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
