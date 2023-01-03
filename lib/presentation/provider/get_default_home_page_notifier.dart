import 'package:flutter/cupertino.dart';
import '../../const.dart';
import '../pages/account/account_page.dart';
import '../pages/favorites/favorites.dart';
import '../pages/home/home.dart';

class GetPages with ChangeNotifier {
  static final List _pagesList = [
    const Home(),
    const Favorites(),
    const Account(),
  ];

  int _index = 0;
  bool _switchToCustomNavBar = false;

  int get index => _index;

  bool get switcher => _switchToCustomNavBar;

  set currentSwitcher(bool current) {
    _switchToCustomNavBar = current;
    notifyListeners();
  }

  set currentIndex(int current) {
    _index = current;
    notifyListeners();
  }

  Widget getPage() {
    return _pagesList.elementAt(_index);
  }

  String getLabel() {
    return labelList.elementAt(_index);
  }
}
