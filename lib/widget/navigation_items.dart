import 'package:flutter/material.dart';
import 'package:luvit/config/color.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
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
    return Column(
      children: [
        label == ""
            ? Container()
            : Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image)),
                  // borderRadius: BorderRadius.circular(100),
                  //  color: Colors.amber,
                ),
              ),
        5.height,
        Text(
          label == "" ? '' : label,
          style: TextStyle(
              color: selected ? ColorConfig.primary : ColorConfig.shade,
              fontSize: 16),
        )
      ],
    );
  }
}
