// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NavigationBarNotifier extends ChangeNotifier {
  int _pageIndex = 0;
  int serviceIndex = 0;
  int get pageIndex {
    return _pageIndex;
  }

  set pageIndex(int newIndex) {
    _pageIndex = newIndex;
    notifyListeners();
  }

  void resetIndex() {
    _pageIndex = 0;
  }
}
