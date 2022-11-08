
import 'package:flutter/cupertino.dart';
import '../../const.dart';
import '../pages/account_page.dart';
import '../pages/favorite_page.dart';
import '../pages/home_page/home_page.dart';

class Pages with ChangeNotifier {
  final List _pagesList = [
    const MyHomePage(),
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
