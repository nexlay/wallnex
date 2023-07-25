import 'package:flutter/cupertino.dart';
import 'package:wallnex/features/images/presentation/page/home/widgets/categories_header.dart';
import 'package:wallnex/features/subscription/presentation/page/purchases_page.dart';
import '../features/favorites/presentation/page/favorites.dart';
import '../features/images/presentation/page/home/home.dart';
import '../features/profile/profile_page.dart';


///Pages [Home], [Favorites], [Profile]
const kPagesList = [Home(), Favorites(), Profile()];

///[CategoriesHeader] assets
const kCategoriesListAsset = [
  'Landscapes',
  'Cityscapes',
  'Abstract',
  'Space',
  'Cars',
];
///[PurchasesPage] assets
final kSubscriptionBenefits = [
  'assets/image/subscription/ad_free.png',
  'assets/image/subscription/customer_support.png',
  'assets/image/subscription/customization.png',
];

const kEmpty = SliverToBoxAdapter();

const kDefaultValue = 0.0;
const kTitleScale = 1.5;
const kAppPadding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0);
const kSocialIconSize = 35.0;
const kFontSize = 18.0;
const kOpacity = 0.1;
const kRadius = 8.0;




