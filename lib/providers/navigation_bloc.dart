import 'package:flutter/material.dart';

class NavigationBloc extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex {
    return _currentIndex;
  }

  set changeCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
