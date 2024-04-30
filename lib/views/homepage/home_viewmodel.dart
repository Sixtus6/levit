import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  late PageController pageController;
  void init() {
    pageController = PageController(initialPage: 1, viewportFraction: 0.86);
  }

  int currentPage = 1;
  void setPageState() {}
}
