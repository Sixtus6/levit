import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luvit/config/color.dart';
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
                    Stack(
                      children: [
                        SizedBox(
                          height: SizeConfigs.getPercentageHeight(70),
                          child: PageView.builder(
                            controller: model.pageController,
                            itemBuilder: (BuildContext context, int index) {
                              return AnimatedBuilder(
                                animation: model.pageController,
                                builder: (context, child) {
                                  return child!;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ColorConfig.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  height: SizeConfigs.getPercentageHeight(100),
                                ).paddingSymmetric(horizontal: 10),
                              );
                            },
                            itemCount: 5,
                          ),
                        ),
                        Positioned(
                          top: 18,
                          left: 50,
                          child: Row(
                              children: List.generate(
                            5,
                            (index) => const indicatorWidget(
                              currentScreen: true,
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
