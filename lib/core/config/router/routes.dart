import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/favorites/presentation/page/favorites.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/features/images/presentation/page/details/image_details_page.dart';
import 'package:wallnex/features/profile/account_and_login/presentation/account.dart';
import 'package:wallnex/features/profile/account_and_login/presentation/forgot_password.dart';
import 'package:wallnex/features/profile/customization/presentation/page/appearance/appearance.dart';
import 'package:wallnex/features/profile/customization/presentation/page/customization/customization.dart';
import 'package:wallnex/wrapper.dart';
import '../../../features/preview/presentation/page/preview_page.dart';
import '../../../features/profile/account_and_login/presentation/email_verification.dart';
import '../../../features/profile/account_and_login/presentation/login.dart';
import '../../../features/profile/app_info/presentation/page/about.dart';
import '../../../features/profile/app_info/presentation/page/discover_more.dart';
import '../../../features/profile/profile_page.dart';

class AppRouter {
  static Widget _homeRouteBuilder(_, state) => const Wrapper();
  static Widget _favoritesRouteBuilder(_, state) => const Favorites();
  static Widget _profileRouteBuilder(_, state) => const Profile();
  static Widget _detailsRouteBuilder(_, state) =>
      ImageDetails(wallpaper: state.extra as Wallpaper);
  static Widget _previewRouteBuilder(_, state) =>
      PreviewPage(wallpaper: state.extra as Wallpaper);
  static Widget _accountRouteBuilder(_, state) => const Account();
  static Widget _loginRouteBuilder(_, state) => const Login();
  static Widget _emailVerificationRouteBuilder(_, state) =>
      const EmailVerification();
  static Widget _forgotPasswordRouteBuilder(_, state) =>
      ForgotPassword(email: state.extra);
  static Widget _appearanceRouteBuilder(_, state) => const Appearance();
  static Widget _customizationRouteBuilder(_, state) => const Customization();
  static Widget _appInformationRouteBuilder(_, state) => const AppInformation();
  static Widget _discoverMoreRouteBuilder(_, state) => const DiscoverMore();

  ///[MaterialApp.router]
  static final _router = GoRouter(
    initialLocation: root,
    routes: [
      GoRoute(path: root, builder: _homeRouteBuilder),
      GoRoute(path: favorites, builder: _favoritesRouteBuilder),
      GoRoute(path: profile, builder: _profileRouteBuilder),
      GoRoute(path: details, builder: _detailsRouteBuilder),
      GoRoute(path: preview, builder: _previewRouteBuilder),
      GoRoute(path: account, builder: _accountRouteBuilder),
      GoRoute(path: login, builder: _loginRouteBuilder),
      GoRoute(path: emailVerification, builder: _emailVerificationRouteBuilder),
      GoRoute(path: forgotPassword, builder: _forgotPasswordRouteBuilder),
      GoRoute(path: appearance, builder: _appearanceRouteBuilder),
      GoRoute(path: customization, builder: _customizationRouteBuilder),
      GoRoute(path: appInformation, builder: _appInformationRouteBuilder),
      GoRoute(path: discoverMore, builder: _discoverMoreRouteBuilder),
    ],
  );

  GoRouter get router => _router;
}
