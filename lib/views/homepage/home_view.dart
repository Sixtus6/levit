import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luvit/config/color.dart';
import 'package:luvit/config/images.dart';
import 'package:luvit/config/size.dart';
import 'package:luvit/views/homepage/home_viewmodel.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stacked/stacked.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeScreenViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: ((context, model, child) => SafeArea(
              child: Scaffold(
                  backgroundColor: ColorConfig.scaffold,
                  body: Column(
                    children: [
                      50.height,
                      Stack(
                        children: [
                          SizedBox(
                            height: SizeConfigs.getPercentageHeight(70),
                            child: PageView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: model.pageController,
                              onPageChanged: (value) {
                                model.setPageState(value);
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return AnimatedBuilder(
                                  animation: model.pageController,
                                  builder: (context, child) {
                                    return child!;
                                  },
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                        child: Draggable(
                                          data: index,
                                          feedback: Container(
                                            width:
                                                SizeConfigs.getPercentageWidth(
                                                    75),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fitHeight,
                                                  image: AssetImage(
                                                      model.imageList[index]),
                                                ),
                                                //  color: ColorConfig.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            height:
                                                SizeConfigs.getPercentageHeight(
                                                    60),
                                          ),
                                          childWhenDragging: Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    // image: DecorationImage(
                                                    //   fit: BoxFit.fitHeight,
                                                    //   image: AssetImage(
                                                    //       model.imageList[index]),
                                                    // ),
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                height: SizeConfigs
                                                    .getPercentageHeight(100),
                                              ).paddingSymmetric(
                                                  horizontal: 10),
                                              Positioned(
                                                //top: 0,
                                                left: 10,
                                                child: DragTarget(
                                                  onWillAccept: (data) => true,
                                                  builder:
                                                      (BuildContext context,
                                                              accepted,
                                                              reject) =>
                                                          Container(
                                                    width: 100,
                                                    height: SizeConfigs
                                                        .getPercentageHeight(
                                                            200),
                                                    color: Colors.transparent,
                                                  ),
                                                  // onAcceptWithDetails: (details) {
                                                  //   model.deleteImage(int.parse(
                                                  //       details.data.toString()));
                                                  //   print("leavwe");
                                                  // },
                                                  onLeave: (data) {
                                                    model.deleteImage(int.parse(
                                                        data.toString()));
                                                  },
                                                  // onAccept: (data) =>
                                                  //     model.deleteImage(int.parse(
                                                  //         data.toString())),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                left: 20,
                                                child: DragTarget(
                                                  onWillAccept: (data) => true,
                                                  builder:
                                                      (BuildContext context,
                                                              accepted,
                                                              reject) =>
                                                          Container(
                                                    height: SizeConfigs
                                                        .getPercentageHeight(
                                                            10),
                                                    width: SizeConfigs
                                                        .getPercentageWidth(80),
                                                    color: Colors.transparent,
                                                  ),
                                                  // onAcceptWithDetails:
                                                  //     (details) {
                                                  //   print("leavwe1");
                                                  //   print(int.parse(details.data
                                                  //       .toString()));

                                                  //   model.deleteImage(int.parse(
                                                  //       details.data
                                                  //           .toString()));
                                                  // },
                                                  onLeave: (data) {
                                                    model.deleteImage(int.parse(
                                                        data.toString()));
                                                    print("leave1 ${data}");
                                                  },
                                                  // onAccept: (int data) =>
                                                  //     model.deleteImage(data)
                                                ),
                                              ),
                                            ],
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fitHeight,
                                                  image: AssetImage(
                                                      model.imageList[index]),
                                                ),
                                                // color: ColorConfig.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            height:
                                                SizeConfigs.getPercentageHeight(
                                                    100),
                                          ).paddingSymmetric(horizontal: 10),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 10,
                                        child: GestureDetector(
                                          onTap: () {
                                            model.pageController.animateToPage(
                                                model.currentPage <= 0
                                                    ? 0
                                                    : model.currentPage - 1,
                                                duration:
                                                    const Duration(seconds: 1),
                                                curve: Curves.easeInOut);
                                            print('Top left corner tapped!');
                                            // Add your desired functionality here
                                          },
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 10,
                                        child: GestureDetector(
                                          onTap: () {
                                            model.pageController.animateToPage(
                                                model.currentPage >= 4
                                                    ? 4
                                                    : model.currentPage + 1,
                                                duration:
                                                    const Duration(seconds: 1),
                                                curve: Curves.easeInOut);

                                            // Add your desired functionality here
                                            print('Top right corner tapped!');
                                            // Add your desired functionality here
                                          },
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: model.imageList.length,
                            ),
                          ),
                          Positioned(
                            top: 18,
                            left: 50,
                            child: Row(
                                children: List.generate(
                              model.imageList.length,
                              (index) {
                                print("------------------");
                                print([
                                  index,
                                  model.currentPage,
                                  model.imageList
                                      .indexOf(model.imageList[index])
                                ]);
                                return indicatorWidget(
                                  currentScreen: index == model.currentPage,
                                ).paddingSymmetric(horizontal: 4);
                              },
                            )),
                          )
                        ],
                      )
                    ],
                  ),
                  bottomNavigationBar: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 110,
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black,
                              border: Border.all(
                                  width: 2, color: ColorConfig.shade)),
                        ),
                      ),
                      Container(
                        height: 90,
                        decoration: BoxDecoration(
                            color: ColorConfig.shade,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        child: Container(
                          width: double.infinity,
                          height: 78,
                          margin: EdgeInsets.only(top: 3),
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black,
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                        ),
                      ),
                      Positioned(
                        top: 1,
                        child: Container(
                          width: 99,
                          height: 99,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(ImageConfig.star)),
                            borderRadius: BorderRadius.circular(100),
                            //  color: Colors.amber,
                          ),
                        ),
                      ),
                      NavWidget(
                        label: '홈',
                        left: 21,
                        selected: true,
                        image: ImageConfig.homeIcon,
                      ),
                      NavWidget(
                        label: '스팟',
                        left: 100,
                        //selected: true,
                        image: ImageConfig.navIcon,
                      ),
                      NavWidget(
                        label: '채팅',
                        left: 285,
                        //selected: true,
                        image: ImageConfig.navIcon,
                      ),
                    ],
                  )),
            )));
  }
}

class NavWidget extends StatelessWidget {
  NavWidget({
    super.key,
    required this.left,
    required this.label,
    this.selected = false,
    required this.image,
  });
  final double left;
  final String label;
  final String image;

  bool selected;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: left,
      child: Column(
        children: [
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image)),
                borderRadius: BorderRadius.circular(100),
                //  color: Colors.amber,
                border: Border.all(width: 2, color: Colors.black)),
          ),
          Text(
            label,
            style: TextStyle(
                color: selected ? ColorConfig.primary : ColorConfig.shade,
                fontSize: 20),
          )
        ],
      ),
    );
  }
}

class indicatorWidget extends StatelessWidget {
  const indicatorWidget({
    super.key,
    required this.currentScreen,
  });
  final bool currentScreen;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 3.5,
      decoration: BoxDecoration(
          color: currentScreen ? ColorConfig.primary : ColorConfig.scaffold,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
