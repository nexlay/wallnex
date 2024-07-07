import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallnex/features/favorites/presentation/page/favorites.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/features/images/presentation/page/details/image_details_page.dart';
import 'package:wallnex/features/messaging/presentation/page/conversations.dart';
import 'package:wallnex/features/profile/account_and_login/presentation/page/account.dart';
import 'package:wallnex/features/profile/account_and_login/presentation/page/forgot_password.dart';
import 'package:wallnex/features/profile/customization/presentation/page/appearance/appearance.dart';
import 'package:wallnex/features/profile/customization/presentation/page/customization/customization.dart';
import 'package:wallnex/wrapper.dart';
import '../../../const/route_paths.dart';
import '../../../features/messaging/presentation/page/chat.dart';
import '../../../features/preview/presentation/page/preview_page.dart';
import '../../../features/profile/account_and_login/presentation/page/email_verification.dart';
import '../../../features/profile/account_and_login/presentation/page/login.dart';
import '../../../features/profile/app_info/presentation/page/about.dart';
import '../../../features/profile/app_info/presentation/page/discover_more.dart';
import '../../../features/profile/dev_info/page/developer_info.dart';
import '../../../features/profile/profile_page.dart';
import '../../../features/subscription/presentation/page/purchases.dart';

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
  static Widget _devInfoRouteBuilder(_, state) => const DeveloperInfo();
  static Widget _purchasesRouteBuilder(_, state) =>
      const PurchasesAndSubscriptions();
  static Widget _conversationListRouteBuilder(_, state) =>
       ConversationsList(wallpaper: state.extra as Wallpaper);
  static Widget _chatScreenRouteBuilder(_, state) =>
       ChatScreen(wallpaper: state.extra as Wallpaper);

  ///[MaterialApp.router]
  static final _router = GoRouter(
    initialLocation: krRoot,
    routes: [
      GoRoute(path: krRoot, builder: _homeRouteBuilder),
      GoRoute(path: krFavorites, builder: _favoritesRouteBuilder),
      GoRoute(path: krDetails, builder: _detailsRouteBuilder),
      GoRoute(path: krPreview, builder: _previewRouteBuilder),
      GoRoute(path: krProfile, builder: _profileRouteBuilder),
      GoRoute(path: krAccount, builder: _accountRouteBuilder),
      GoRoute(path: krLogin, builder: _loginRouteBuilder),
      GoRoute(
          path: krEmailVerification, builder: _emailVerificationRouteBuilder),
      GoRoute(path: krForgotPassword, builder: _forgotPasswordRouteBuilder),
      GoRoute(path: krAppearance, builder: _appearanceRouteBuilder),
      GoRoute(path: krCustomization, builder: _customizationRouteBuilder),
      GoRoute(path: krAppInformation, builder: _appInformationRouteBuilder),
      GoRoute(path: krDiscoverMore, builder: _discoverMoreRouteBuilder),
      GoRoute(path: krDevInfo, builder: _devInfoRouteBuilder),
      GoRoute(path: krPurchases, builder: _purchasesRouteBuilder),
      GoRoute(path: krConversationList, builder: _conversationListRouteBuilder),
      GoRoute(path: krChatScreen, builder: _chatScreenRouteBuilder),
    ],
  );

  GoRouter get router => _router;
}
