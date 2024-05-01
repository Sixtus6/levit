import 'package:flutter/material.dart';
import 'package:luvit/config/images.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  late List<String> imageList = [];
  late PageController pageController;
  bool isDraggedToLeft = false;
  bool isDraggedToBottom = false;
  void init() {
    print("initialize");
    imageList = [
      ImageConfig.image1,
      ImageConfig.image2,
      ImageConfig.image3,
      ImageConfig.image4,
      ImageConfig.image5
    ];
    pageController = PageController(initialPage: 0, viewportFraction: 0.87);
  }

  deleteImage(int indez) {
    print("removed Elememnt ${indez}");
    print(imageList.length);
    print([imageList[indez]]);
    imageList.remove(imageList[indez]);
    print(imageList);
    print('currentPage; ${currentPage}');
    // currentPage = imageList.length > currentPage;
    notifyListeners();
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
