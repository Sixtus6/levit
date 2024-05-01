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
                                        data: model.imageList[index],
                                        feedback: Container(
                                          width: SizeConfigs.getPercentageWidth(
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
                                            ).paddingSymmetric(horizontal: 10),
                                            Positioned(
                                              //top: 0,
                                              left: 10,
                                              child: DragTarget(
                                                onWillAccept: (data) => true,
                                                builder: (BuildContext context,
                                                        accepted, reject) =>
                                                    Container(
                                                  width: 100,
                                                  height: SizeConfigs
                                                      .getPercentageHeight(200),
                                                  color: Colors.transparent,
                                                ),
                                                onAcceptWithDetails: (details) {
                                                  print("leavwe");
                                                },
                                                onLeave: (data) {
                                                  print("leave");
                                                },
                                                onAccept: (data) => print(
                                                    "it has saved for left ${data}"),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              left: 20,
                                              child: DragTarget(
                                                onWillAccept: (data) => true,
                                                builder: (BuildContext context,
                                                        accepted, reject) =>
                                                    Container(
                                                  height: SizeConfigs
                                                      .getPercentageHeight(10),
                                                  width: SizeConfigs
                                                      .getPercentageWidth(80),
                                                  color: Colors.transparent,
                                                ),
                                                onAcceptWithDetails: (details) {
                                                  print("leavwe1");
                                                },
                                                onLeave: (data) {
                                                  print("leave1");
                                                },
                                                onAccept: (data) => print(
                                                    "it has saved for left ${data}"),
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
                            (index) => indicatorWidget(
                              currentScreen: index == model.currentPage,
                            ).paddingSymmetric(horizontal: 4),
                          )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )));
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
