import 'package:flutter/cupertino.dart';

import '../features/favorites/presentation/page/favorites.dart';
import '../features/images/presentation/page/home/home.dart';
import '../features/profile/profile_page.dart';


///Pages [Home], [Favorites], [Profile]
const pagesList = [Home(), Favorites(), Profile()];

const empty = SliverToBoxAdapter();

/// Route paths
const root = '/home';
const favorites = '/favorites';
const profile = '/profile';
const details = '/details';
const preview = '/preview';
const account = '/account';
const login = '/login';
const emailVerification = '/email_verification';
const forgotPassword = '/forgot_password';
const appearance = '/appearance';
const customization = '/customization';
const appInformation = '/appInformation';
const discoverMore = '/discover_more';
const devInfo = '/dev_info';


