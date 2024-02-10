import 'package:flutter/cupertino.dart';
import 'package:wallnex/features/images/presentation/page/home/widgets/categories_header.dart';
import 'package:wallnex/features/sorting/presentation/page/sorting_images_premium_only.dart';
import 'package:wallnex/features/profile/app_info/presentation/page/developer_info.dart';
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
const kAppPadding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0);
const kSocialIconSize = 35.0;
const kFontSize = 18.0;
const kOpacity = 0.1;
const kRadius = 8.0;
const kAppSize = 5.0;




