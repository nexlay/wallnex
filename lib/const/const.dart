import 'package:flutter/material.dart';
import 'package:wallnex/features/images/presentation/page/home/widgets/categories_header.dart';
import 'package:wallnex/features/sorting/presentation/page/sorting_images_premium_only.dart';
import 'package:wallnex/features/profile/dev_info/page/developer_info.dart';
import '../features/categories/presentation/categories_page.dart';
import '../features/favorites/presentation/page/favorites.dart';
import '../features/images/presentation/page/home/home.dart';
import '../features/profile/profile_page.dart';

///Pages [Home], [Favorites], [Profile]
const kPagesList = [Categories(), Home(), Favorites(), Profile()];

///[CategoriesHeader] assets
const kCategoriesListAsset = [
  'Landscapes',
  'Cityscapes',
  'Abstract',
  'Space',
  'Cars',
];

/// [SortingImages]
const kSortingListAsset = [
  'views',
  'relevance',
  'random',
  'favorites',
  'toplist',
];

/// [DeveloperInfo]
const kDevPhoto = 'assets/image/dev/developer.jpg';

const kDefaultValue = 0.0;
const kTitleScale = 1.5;
const kPaddingSize = 10.0;
const kUnselectedIconSize = 30.0;
const kSelectedIconSize = 35.0;
const kFontSize = 18.0;
const kHeightForSpacer = 18.0;
const kOpacity = 0.1;
const kRadius = 18.0;
const kAppSize = 5.0;

const kAppPadding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0);
const kAnimationDuration = Duration(milliseconds: 300);

const kNavBarIcons = [
  Icons.category_outlined,
  Icons.home_outlined,
  Icons.favorite_border,
  Icons.account_circle_outlined,
];
const kNavBarFilledIcons = [
  Icons.category,
  Icons.home,
  Icons.favorite,
  Icons.account_circle,
];
