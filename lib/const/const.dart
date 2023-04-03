import 'package:flutter/cupertino.dart';
import '../features/favorites/presentation/page/favorites.dart';
import '../features/images/presentation/page/home/home.dart';
import '../features/profile/profile_page.dart';


///Pages [Home], [Favorites], [Profile]
const kPagesList = [Home(), Favorites(), Profile()];

const kEmpty = SliverToBoxAdapter();

const appBarElevation = 0.0;
const titleScale = 1.5;

/// Route paths
const krRoot = '/home';
const krFavorites = '/favorites';
const krProfile = '/profile';
const krDetails = '/details';
const krPreview = '/preview';
const krAccount = '/account';
const krLogin = '/login';
const krEmailVerification = '/email_verification';
const krForgotPassword = '/forgot_password';
const krAppearance = '/appearance';
const krCustomization = '/customization';
const krAppInformation = '/appInformation';
const krDiscoverMore = '/discover_more';
const krDevInfo = '/dev_info';


