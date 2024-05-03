import 'package:flutter/material.dart';
import 'package:luvit/config/color.dart';
import 'package:nb_utils/nb_utils.dart';

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
              // borderRadius: BorderRadius.circular(100),
              //  color: Colors.amber,
            ),
          ),
          5.height,
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