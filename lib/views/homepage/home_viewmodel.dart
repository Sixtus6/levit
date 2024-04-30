import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  late PageController pageController;
  void init() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.86);
  }

  int currentPage = 0;
  void setPageState(int value) {
    currentPage = value;
    print(currentPage);
    notifyListeners();
  }
}
