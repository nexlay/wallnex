

/// WallpaperManager.HOME_SCREEN;
const homeScreen = 1;
/// WallpaperManager.LOCK_SCREEN;
const lockScreen = 2;
/// WallpaperManager.BOTH_SCREEN;
const bothScreen = 3;

///API URL
const apiUrl = 'https://wallhaven.cc/api/v1/search?q=&page=';
const imageUrl = 'https://wallhaven.cc/api/v1/w/';
const searchLikIdUrl = 'https://wallhaven.cc/api/v1/search?q=like:';

///Categories
const categoriesList = ['landscapes', 'cityscapes', 'abstract', 'space', 'cars'];
const categoriesUrl = [
  'https://wallhaven.cc/api/v1/search?q=landscapes=&page=',
  'https://wallhaven.cc/api/v1/search?q=cityscapes=&page=',
  'https://wallhaven.cc/api/v1/search?q=abstract=&page=',
      'https://wallhaven.cc/api/v1/search?q=space=&page=',
      'https://wallhaven.cc/api/v1/search?q=cars=&page=',
];

///Name of animation trigger
const riveSwitch = 'switch';

///State Machine path
const String stateMachine = 'state machine';

///Assets Rive
const home = 'assets/rive/home.riv';
const favorite = 'assets/rive/favorite.riv';
const account = 'assets/rive/account.riv';
const welcome = 'assets/rive/welcome_screen.riv';
const loadingOrEmpty = 'assets/rive/loading.riv';
const emptyFavorites = 'assets/rive/empty_favorites_page.riv';
const emptySuggestions = 'assets/rive/no_suggestions.riv';
const lamp = 'assets/rive/lamp.riv';
//Add assets into list
const navBarAssetList = [home, favorite, account];

///Nav Bar Label
const homeLabel = 'Home';
const favoriteLabel = 'Favorites';
const accountLabel = 'Account';
const themeLabel = 'Theme';
//Add labels into the list
const labelList = [homeLabel, favoriteLabel, accountLabel];


///Theme page
const themePageText =
    'Dark theme uses a black background to help keep your battery alive longer and cut the glare from your screen significantly for comfortable viewing. ';
