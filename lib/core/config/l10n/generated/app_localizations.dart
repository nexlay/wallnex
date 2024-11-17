import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_uk.dart';

/// Callers can lookup localized strings with an instance of L
/// returned by `L.of(context)`.
///
/// Applications need to include `L.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L.localizationsDelegates,
///   supportedLocales: L.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L.supportedLocales
/// property.
abstract class L {
  L(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L of(BuildContext context) {
    return Localizations.of<L>(context, L)!;
  }

  static const LocalizationsDelegate<L> delegate = _LDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl'),
    Locale('uk')
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @auto.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get auto;

  /// No description provided for @preview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview;

  /// No description provided for @customization.
  ///
  /// In en, this message translates to:
  /// **'Customization'**
  String get customization;

  /// No description provided for @navigation.
  ///
  /// In en, this message translates to:
  /// **'Navigation'**
  String get navigation;

  /// No description provided for @themeDesc.
  ///
  /// In en, this message translates to:
  /// **'Dark theme uses a black background to help keep your battery alive longer and cut the glare from your screen significantly for comfortable viewing.'**
  String get themeDesc;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageDesc.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language and customize your app experience.'**
  String get languageDesc;

  /// No description provided for @en.
  ///
  /// In en, this message translates to:
  /// **'EN'**
  String get en;

  /// No description provided for @pl.
  ///
  /// In en, this message translates to:
  /// **'PL'**
  String get pl;

  /// No description provided for @uk.
  ///
  /// In en, this message translates to:
  /// **'UK'**
  String get uk;

  /// No description provided for @navigationDesc.
  ///
  /// In en, this message translates to:
  /// **'Get custom navigation bar with animated icon'**
  String get navigationDesc;

  /// No description provided for @gridCount.
  ///
  /// In en, this message translates to:
  /// **'Column width'**
  String get gridCount;

  /// No description provided for @gridCountDesc.
  ///
  /// In en, this message translates to:
  /// **'Allows you to change the number columns and change the size of preview'**
  String get gridCountDesc;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark theme and language'**
  String get darkTheme;

  /// No description provided for @appInfo.
  ///
  /// In en, this message translates to:
  /// **'App info'**
  String get appInfo;

  /// No description provided for @rate_this_app.
  ///
  /// In en, this message translates to:
  /// **'Rate this app'**
  String get rate_this_app;

  /// No description provided for @share_this_app.
  ///
  /// In en, this message translates to:
  /// **'Share this app'**
  String get share_this_app;

  /// No description provided for @bugs_feedback.
  ///
  /// In en, this message translates to:
  /// **'Bugs & Feedback'**
  String get bugs_feedback;

  /// No description provided for @share_text.
  ///
  /// In en, this message translates to:
  /// **'Wallnex: Your walls, your way! Download it at:'**
  String get share_text;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @customizationDesc.
  ///
  /// In en, this message translates to:
  /// **'Change application look'**
  String get customizationDesc;

  /// No description provided for @premium.
  ///
  /// In en, this message translates to:
  /// **'Enhance your user experience'**
  String get premium;

  /// No description provided for @prem.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get prem;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'month'**
  String get month;

  /// No description provided for @features.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get features;

  /// No description provided for @premiumDesc.
  ///
  /// In en, this message translates to:
  /// **'Buy premium features'**
  String get premiumDesc;

  /// No description provided for @yourPremium.
  ///
  /// In en, this message translates to:
  /// **'Your Premium'**
  String get yourPremium;

  /// No description provided for @premiumBenefit_1.
  ///
  /// In en, this message translates to:
  /// **'An ad-free experience'**
  String get premiumBenefit_1;

  /// No description provided for @premiumBenefit_2.
  ///
  /// In en, this message translates to:
  /// **'Priority customer support'**
  String get premiumBenefit_2;

  /// No description provided for @premiumBenefit_3.
  ///
  /// In en, this message translates to:
  /// **'Customization features'**
  String get premiumBenefit_3;

  /// No description provided for @premiumBenefit_4.
  ///
  /// In en, this message translates to:
  /// **'Organize your images'**
  String get premiumBenefit_4;

  /// No description provided for @premiumBenefit_sub_1.
  ///
  /// In en, this message translates to:
  /// **'No ads, just content'**
  String get premiumBenefit_sub_1;

  /// No description provided for @premiumBenefit_sub_2.
  ///
  /// In en, this message translates to:
  /// **'For critical issues and urgent requests'**
  String get premiumBenefit_sub_2;

  /// No description provided for @premiumBenefit_sub_3.
  ///
  /// In en, this message translates to:
  /// **'Create your own look'**
  String get premiumBenefit_sub_3;

  /// No description provided for @premiumBenefit_sub_4.
  ///
  /// In en, this message translates to:
  /// **'Find perfect wallpapers with sorting features'**
  String get premiumBenefit_sub_4;

  /// No description provided for @thanksForPremium.
  ///
  /// In en, this message translates to:
  /// **'Thanks for being a Premium member'**
  String get thanksForPremium;

  /// No description provided for @expirationDate.
  ///
  /// In en, this message translates to:
  /// **'Expiration date: '**
  String get expirationDate;

  /// No description provided for @menageSubscription.
  ///
  /// In en, this message translates to:
  /// **'Menage your subscription'**
  String get menageSubscription;

  /// No description provided for @special_offers_and_features.
  ///
  /// In en, this message translates to:
  /// **'Special offers and features'**
  String get special_offers_and_features;

  /// No description provided for @check_what_you_might_get.
  ///
  /// In en, this message translates to:
  /// **'Check what you might get'**
  String get check_what_you_might_get;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get start;

  /// No description provided for @billed_yearly_cancel_anytime.
  ///
  /// In en, this message translates to:
  /// **'No commitment, cancel anytime'**
  String get billed_yearly_cancel_anytime;

  /// No description provided for @getting_the_best_of_Wallnex.
  ///
  /// In en, this message translates to:
  /// **'You\'re now getting the best of Wallnex'**
  String get getting_the_best_of_Wallnex;

  /// No description provided for @discoverMore.
  ///
  /// In en, this message translates to:
  /// **'Discover more'**
  String get discoverMore;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @suggestionsNotFound.
  ///
  /// In en, this message translates to:
  /// **'Similar images not found!'**
  String get suggestionsNotFound;

  /// No description provided for @tryToReloadSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Try to search something else.'**
  String get tryToReloadSuggestions;

  /// No description provided for @suggestions.
  ///
  /// In en, this message translates to:
  /// **'Suggestions'**
  String get suggestions;

  /// No description provided for @suggestionsDesc.
  ///
  /// In en, this message translates to:
  /// **'based on chosen image'**
  String get suggestionsDesc;

  /// No description provided for @usedColors.
  ///
  /// In en, this message translates to:
  /// **'Used colors'**
  String get usedColors;

  /// No description provided for @usedColorsDesc.
  ///
  /// In en, this message translates to:
  /// **'search wallpapers by color'**
  String get usedColorsDesc;

  /// No description provided for @imagesNotFound.
  ///
  /// In en, this message translates to:
  /// **'Oops...Something went wrong!'**
  String get imagesNotFound;

  /// No description provided for @tryToReload.
  ///
  /// In en, this message translates to:
  /// **'Try to reload.'**
  String get tryToReload;

  /// No description provided for @reload.
  ///
  /// In en, this message translates to:
  /// **'Reload'**
  String get reload;

  /// No description provided for @noFavorites.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet!'**
  String get noFavorites;

  /// No description provided for @noFavoritesDesc.
  ///
  /// In en, this message translates to:
  /// **'Once you favorite an image, you\'ll see it here.'**
  String get noFavoritesDesc;

  /// No description provided for @searchImages.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchImages;

  /// No description provided for @landscapes.
  ///
  /// In en, this message translates to:
  /// **'Landscapes'**
  String get landscapes;

  /// No description provided for @cityscapes.
  ///
  /// In en, this message translates to:
  /// **'Cityscapes'**
  String get cityscapes;

  /// No description provided for @abstract.
  ///
  /// In en, this message translates to:
  /// **'Abstract'**
  String get abstract;

  /// No description provided for @space.
  ///
  /// In en, this message translates to:
  /// **'Space'**
  String get space;

  /// No description provided for @cars.
  ///
  /// In en, this message translates to:
  /// **'Cars'**
  String get cars;

  /// No description provided for @relevance_sorting.
  ///
  /// In en, this message translates to:
  /// **'relevance'**
  String get relevance_sorting;

  /// No description provided for @random_sorting.
  ///
  /// In en, this message translates to:
  /// **'random'**
  String get random_sorting;

  /// No description provided for @favorites_sorting.
  ///
  /// In en, this message translates to:
  /// **'favorites'**
  String get favorites_sorting;

  /// No description provided for @toplist_sorting.
  ///
  /// In en, this message translates to:
  /// **'toplist'**
  String get toplist_sorting;

  /// No description provided for @noSearchHistory.
  ///
  /// In en, this message translates to:
  /// **'Nothing to show'**
  String get noSearchHistory;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'category'**
  String get category;

  /// No description provided for @uploader.
  ///
  /// In en, this message translates to:
  /// **'uploader'**
  String get uploader;

  /// No description provided for @imageName.
  ///
  /// In en, this message translates to:
  /// **'name'**
  String get imageName;

  /// No description provided for @fileType.
  ///
  /// In en, this message translates to:
  /// **'file type'**
  String get fileType;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'size'**
  String get size;

  /// No description provided for @views.
  ///
  /// In en, this message translates to:
  /// **'views'**
  String get views;

  /// No description provided for @resolution.
  ///
  /// In en, this message translates to:
  /// **'resolution'**
  String get resolution;

  /// No description provided for @homeScreen.
  ///
  /// In en, this message translates to:
  /// **'Home screen'**
  String get homeScreen;

  /// No description provided for @lockScreen.
  ///
  /// In en, this message translates to:
  /// **'Lock screen'**
  String get lockScreen;

  /// No description provided for @both.
  ///
  /// In en, this message translates to:
  /// **'Both'**
  String get both;

  /// No description provided for @set_wallpaper_on.
  ///
  /// In en, this message translates to:
  /// **'Set wallpaper on'**
  String get set_wallpaper_on;

  /// No description provided for @storagePermission.
  ///
  /// In en, this message translates to:
  /// **'Storage permission'**
  String get storagePermission;

  /// No description provided for @notificationPermission.
  ///
  /// In en, this message translates to:
  /// **'Notifications permission'**
  String get notificationPermission;

  /// No description provided for @permissionDesc.
  ///
  /// In en, this message translates to:
  /// **'You need to give this permissions from the system settings'**
  String get permissionDesc;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get welcome;

  /// No description provided for @creatingAccount.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start creating your account'**
  String get creatingAccount;

  /// No description provided for @yourInfo.
  ///
  /// In en, this message translates to:
  /// **'Your info'**
  String get yourInfo;

  /// No description provided for @madeBy.
  ///
  /// In en, this message translates to:
  /// **'Mykola Pryhodskyi'**
  String get madeBy;

  /// No description provided for @developer.
  ///
  /// In en, this message translates to:
  /// **'App developer & Designer'**
  String get developer;

  /// No description provided for @developer_email.
  ///
  /// In en, this message translates to:
  /// **'pryhodskyimykola@gmail.com'**
  String get developer_email;

  /// No description provided for @subscribe.
  ///
  /// In en, this message translates to:
  /// **'Follow me'**
  String get subscribe;

  /// No description provided for @subscribe_desc.
  ///
  /// In en, this message translates to:
  /// **'To know about new products'**
  String get subscribe_desc;

  /// No description provided for @follow_desc.
  ///
  /// In en, this message translates to:
  /// **'Follow me to stay updated on app features and more!'**
  String get follow_desc;

  /// No description provided for @like.
  ///
  /// In en, this message translates to:
  /// **'Like'**
  String get like;

  /// No description provided for @dislike.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get dislike;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @location_description.
  ///
  /// In en, this message translates to:
  /// **'Poland'**
  String get location_description;

  /// No description provided for @languages_and_tools.
  ///
  /// In en, this message translates to:
  /// **'Languages and Tools'**
  String get languages_and_tools;

  /// No description provided for @tool_description.
  ///
  /// In en, this message translates to:
  /// **'Flutter, Dart, Firebase, Git, Rive'**
  String get tool_description;

  /// No description provided for @fun_fact.
  ///
  /// In en, this message translates to:
  /// **'Fun fact'**
  String get fun_fact;

  /// No description provided for @fun_fact_description.
  ///
  /// In en, this message translates to:
  /// **'I can lower the price by up to 100%. Then you pay nothing and I do nothing :)'**
  String get fun_fact_description;
}

class _LDelegate extends LocalizationsDelegate<L> {
  const _LDelegate();

  @override
  Future<L> load(Locale locale) {
    return SynchronousFuture<L>(lookupL(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pl', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_LDelegate old) => false;
}

L lookupL(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return LEn();
    case 'pl': return LPl();
    case 'uk': return LUk();
  }

  throw FlutterError(
    'L.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
