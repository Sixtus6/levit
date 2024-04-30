import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  late PageController pageController;
  void init() {
    pageController = PageController();
  }
}
