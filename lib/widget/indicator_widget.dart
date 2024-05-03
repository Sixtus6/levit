import 'package:flutter/cupertino.dart';
import 'package:luvit/config/color.dart';

class indicatorWidget extends StatelessWidget {
  const indicatorWidget({
    super.key,
    required this.currentScreen,
  });
  final bool currentScreen;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 3.5,
      decoration: BoxDecoration(
          color: currentScreen ? ColorConfig.primary : ColorConfig.scaffold,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
