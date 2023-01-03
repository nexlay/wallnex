/// WallpaperManager.HOME_SCREEN;
const homeScreen = 1;

/// WallpaperManager.LOCK_SCREEN;
const lockScreen = 2;

/// WallpaperManager.BOTH_SCREEN;
const bothScreen = 3;

///Name of buttons in [SetWallpaperButtonsBar]
const setWallpaperList = ['Home screen', 'Lock screen', 'Both'];

///API URL
const apiUrl = 'https://wallhaven.cc/api/v1/search?q=&page=';
const imageUrl = 'https://wallhaven.cc/api/v1/w/';
const searchLikIdUrl = 'https://wallhaven.cc/api/v1/search?q=like:';

///Categories
const categoriesList = [
  'Landscapes',
  'Cityscapes',
  'Abstract',
  'Space',
  'Cars',
  'Minimal',
  'Architecture',
  'Photography',
  'Animals',
  'History',
  'Military',
  'Ships',
  'Music',
];
const categoriesUrl = 'https://wallhaven.cc/api/v1/search?q=';
const categoriesPage = '=&page=';

///Name of animation trigger
const riveSwitch = 'switch';

///State Machine path
const String stateMachine = 'state machine';

///Assets Rive
const home = 'assets/rive/home.riv';
const favorite = 'assets/rive/favorite.riv';
const account = 'assets/rive/account.riv';
const welcome = 'assets/rive/welcome_screen.riv';
const emptyFavorites = 'assets/rive/empty_favorites_page.riv';
const emptySuggestions = 'assets/rive/no_suggestions.riv';
const lamp = 'assets/rive/lamp.riv';
//Add assets into list
const navBarAssetList = [home, favorite, account];

///Nav Bar Label
const themeLabel = 'Theme';
const previewLabel = 'Preview';
//Add main page labels into the list
const labelList = ['Home', 'Favorites', 'Account'];

///Theme page
const themePageText =
    'Dark theme uses a black background to help keep your battery alive longer and cut the glare from your screen significantly for comfortable viewing. ';
