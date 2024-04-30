import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luvit/config/color.dart';
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
        builder: ((context, viewModel, child) => Scaffold(
              backgroundColor: ColorConfig.scaffold,
              body: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: PageView.builder(controller: itemBuilder),
                  )
                ],
              ),
            )));
  }
}
