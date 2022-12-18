
import 'package:flutter/cupertino.dart';
import '../../const.dart';
import '../pages/account_page/account_page.dart';
import '../pages/favorites_page/favorite_page.dart';
import '../pages/home_page/home_page.dart';

class GetPages with ChangeNotifier {
  final List _pagesList = [
    const WallnexHomePage(),
    const FavoritePage(),
    const AccountPage(),
  ];

  int _index = 0;

  int get getIndex => _index;

  set setIndex(int current) {
    _index = current;
    notifyListeners();
  }

  Widget getPage() {
    return _pagesList.elementAt(_index);
  }

  String getLabel () {
    return labelList.elementAt(_index);
  }
}
