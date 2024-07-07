import 'package:flutter/cupertino.dart';

class GetPages extends ValueNotifier<int> {
  GetPages() : super(1);

  int get selectedIndex => value;

  void changeTab(int index) {
    value = index;
    notifyListeners(); // Notify listeners when the index changes
  }
}
