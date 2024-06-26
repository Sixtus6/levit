import 'package:flutter/material.dart';

import 'package:luvit/config/color.dart';
import 'package:luvit/config/images.dart';
import 'package:luvit/config/size.dart';
import 'package:luvit/views/homepage/home_viewmodel.dart';
import 'package:luvit/widget/cards_text.dart';
import 'package:luvit/widget/custom_appbar.dart';
import 'package:luvit/widget/indicator_widget.dart';

import 'package:luvit/widget/nav_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stacked/stacked.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfigs().init(context);
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeScreenViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: ((context, model, child) => SafeArea(
              child: SafeArea(
                child: Scaffold(
                    backgroundColor: ColorConfig.scaffold,
                    body: model.imageList.isEmpty
                        ? Column(
                            children: [
                              SizeConfigs.screenHeight <= 900
                                  ? SizeConfigs.getPercentageHeight(2)
                                      .toInt()
                                      .height
                                  : Container(),
                              //APPBAR
                              const CustomAppbar().paddingBottom(
                                  SizeConfigs.getPercentageHeight(30)),
                              const Text(
                                "추천 드릴 친구들을 준비 중이에요",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 24),
                              ).paddingBottom(15).center(),
                              const Text(
                                "매일 새로운 친구들을 소개시켜드려요",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ).center(),
                            ],
                          )
                        : Column(
                            children: [
                              SizeConfigs.screenHeight <= 900
                                  ? SizeConfigs.getPercentageHeight(2)
                                      .toInt()
                                      .height
                                  : Container(),
                              // 20.height,
                              //APPBAR
                              const CustomAppbar().paddingBottom(
                                  SizeConfigs.getPercentageHeight(2)),
                              Stack(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: SizeConfigs.getPercentageHeight(70),
                                    child: PageView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      controller: model.pageController,
                                      onPageChanged: (value) {
                                        model.setPageState(value);
                                      },
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return AnimatedBuilder(
                                          animation: model.pageController,
                                          builder: (context, child) {
                                            return child!;
                                          },
                                          child: Stack(
                                            children: [
                                              Draggable(
                                                data: index,
                                                feedback: Container(
                                                  width: SizeConfigs
                                                      .getPercentageWidth(75),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: ColorConfig
                                                              .shade),
                                                      image: DecorationImage(
                                                        fit: BoxFit.fitWidth,
                                                        image: AssetImage(model
                                                            .imageList[index]),
                                                      ),
                                                      //  color: ColorConfig.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  height: SizeConfigs
                                                      .getPercentageHeight(60),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(19),
                                                          gradient:
                                                              const LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                            colors: [
                                                              Color.fromARGB(
                                                                  0,
                                                                  110,
                                                                  109,
                                                                  109),
                                                              Colors
                                                                  .black, // Transparent color at the top
                                                              // Solid color at the bottom
                                                            ],
                                                          ),
                                                        ),
                                                        height: 310,
                                                      )
                                                    ],
                                                  ),
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
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      height: SizeConfigs
                                                          .getPercentageHeight(
                                                              100),
                                                    ).paddingSymmetric(
                                                        horizontal: 10),
                                                    Positioned(
                                                      //top: 0,
                                                      left: 10,
                                                      child: DragTarget(
                                                        onWillAccept: (data) =>
                                                            true,
                                                        builder: (BuildContext
                                                                    context,
                                                                accepted,
                                                                reject) =>
                                                            Container(
                                                          width: 100,
                                                          height: SizeConfigs
                                                              .getPercentageHeight(
                                                                  200),
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        // onAcceptWithDetails: (details) {
                                                        //   model.deleteImage(int.parse(
                                                        //       details.data.toString()));
                                                        //   print("leavwe");
                                                        // },
                                                        onLeave: (data) {
                                                          model.deleteImage(
                                                              int.parse(data
                                                                  .toString()));
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
                                                        onWillAccept: (data) =>
                                                            true,
                                                        builder: (BuildContext
                                                                    context,
                                                                accepted,
                                                                reject) =>
                                                            Container(
                                                          height: SizeConfigs
                                                              .getPercentageHeight(
                                                                  10),
                                                          width: SizeConfigs
                                                              .getPercentageWidth(
                                                                  80),
                                                          color: Colors
                                                              .transparent,
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
                                                          model.deleteImage(
                                                              int.parse(data
                                                                  .toString()));
                                                        },
                                                        // onAccept: (int data) =>
                                                        //     model.deleteImage(data)
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: ColorConfig
                                                              .shade),
                                                      image: DecorationImage(
                                                        fit: BoxFit.fitHeight,
                                                        image: AssetImage(model
                                                            .imageList[index]),
                                                      ),
                                                      // color: ColorConfig.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  height: SizeConfigs
                                                      .getPercentageHeight(100),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(19),
                                                          gradient:
                                                              const LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                            colors: [
                                                              Colors
                                                                  .transparent,
                                                              Colors
                                                                  .black, // Transparent color at the top
                                                              // Solid color at the bottom
                                                            ],
                                                          ),
                                                        ),
                                                        height: SizeConfigs
                                                            .getPercentageHeight(
                                                                37),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            model.imageList[index] ==
                                                                    ImageConfig
                                                                        .image1
                                                                ? const Card1()
                                                                    .paddingSymmetric(
                                                                        horizontal:
                                                                            20)
                                                                : model.imageList[index] ==
                                                                        ImageConfig
                                                                            .image2
                                                                    ? const Card2()
                                                                        .paddingSymmetric(
                                                                            horizontal:
                                                                                20)
                                                                    : const Card3().paddingSymmetric(
                                                                        horizontal:
                                                                            17),
                                                            Image.asset(
                                                              ImageConfig.arrow,
                                                              height: 9,
                                                            ).paddingSymmetric(
                                                                vertical:
                                                                    SizeConfigs
                                                                        .getPercentageHeight(
                                                                            3)),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ).paddingSymmetric(
                                                    horizontal: 10),
                                              ),
                                              Positioned(
                                                top: 0,
                                                left: 10,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    model.pageController
                                                        .animateToPage(
                                                            model.currentPage <=
                                                                    0
                                                                ? 0
                                                                : model.currentPage -
                                                                    1,
                                                            duration:
                                                                const Duration(
                                                                    seconds: 1),
                                                            curve: Curves
                                                                .easeInOut);
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
                                                    model.pageController
                                                        .animateToPage(
                                                            model.currentPage >=
                                                                    4
                                                                ? 4
                                                                : model.currentPage +
                                                                    1,
                                                            duration:
                                                                const Duration(
                                                                    seconds: 1),
                                                            curve: Curves
                                                                .easeInOut);
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
                                    left: SizeConfigs.getPercentageWidth(10),
                                    child: Row(
                                        children: List.generate(
                                      model.imageList.length,
                                      (index) {
                                        return IndicatorWidget(
                                          currentScreen:
                                              index == model.currentPage,
                                        ).paddingSymmetric(horizontal: 4);
                                      },
                                    )),
                                  )
                                ],
                              )
                            ],
                          ),
                    bottomNavigationBar: CustomNavBar(
                      data: model.navData,
                    )),
              ),
            )));
  }
}
