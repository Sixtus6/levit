import 'package:flutter/material.dart';
import 'package:luvit/config/images.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  late List<String> imageList = [];
  late List<String> navIcon = [];
  late PageController pageController;
  bool isDraggedToLeft = false;
  bool isDraggedToBottom = false;
  List navData = [
    {"icon": ImageConfig.homeIcon, "text": '홈'},
    {"icon": ImageConfig.map2, "text": '스팟'},
    {"icon": ImageConfig.map2, "text": '채팅'},
    {"icon": ImageConfig.chatIcon, "text": '마이'},
    {"icon": ImageConfig.personIcon, "text": '마이'},
  ];

  void init() {
    // print("initialize");
    imageList = [
      ImageConfig.image1,
      ImageConfig.image2,
      ImageConfig.image3,
      ImageConfig.image4,
      ImageConfig.image5
    ];

    navIcon = [];
    pageController = PageController(initialPage: 0, viewportFraction: 0.87);
  }

  deleteImage(int indez) {
    // print("removed Elememnt ${indez}");
    // print(imageList.length);
    // print([imageList[indez]]);

    // print(imageList);
    // print('currentPage; ${currentPage}');

    imageList.remove(imageList[indez]);
    currentPage =
        currentPage >= imageList.length ? currentPage - 1 : currentPage;
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
    // print(currentPage);
    notifyListeners();
  }
}
