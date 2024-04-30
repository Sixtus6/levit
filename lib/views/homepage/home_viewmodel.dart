import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  late PageController pageController;
  bool isDraggedToLeft = false;
  bool isDraggedToBottom = false;
  void init() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.87);
  }

  setDraggedLeftListener(bool value) {
    isDraggedToLeft = value;
    notifyListeners();
  }

  setDraggedButtomListener(bool value) {
    isDraggedToBottom = value;
  }

  int currentPage = 0;
  void setPageState(int value) {
    currentPage = value;
    print(currentPage);
    notifyListeners();
  }
}
