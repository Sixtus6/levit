import 'package:flutter/cupertino.dart';
import 'package:luvit/config/color.dart';
import 'package:luvit/config/size.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    super.key,
    required this.currentScreen,
  });
  final bool currentScreen;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfigs.getPercentageWidth(14),
      height: 3.5,
      decoration: BoxDecoration(
          color: currentScreen ? ColorConfig.primary : ColorConfig.scaffold,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
