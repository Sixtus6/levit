import 'package:flutter/material.dart';
import 'package:luvit/config/color.dart';
import 'package:luvit/config/images.dart';
import 'package:luvit/widget/navigation_items.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.data,
  });
  final List data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 100,
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
                    width: 2, color: ColorConfig.shade.withOpacity(0.6))),
          ),
        ),
        Container(
          height: 80,
          decoration: BoxDecoration(
              color: ColorConfig.shade.withOpacity(0.6),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20))),
          child: Container(
            width: double.infinity,
            height: 78,
            margin: const EdgeInsets.only(top: 2),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          ),
        ),
        Positioned(
          top: 10,
          child: Container(
            width: 161,
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.black,
                border: Border.all(width: 2, color: Colors.black)),
          ),
        ),
        Positioned(
          top: 1,
          child: Container(
            width: 89,
            height: 89,
            decoration: BoxDecoration(
              image: const DecorationImage(image: AssetImage(ImageConfig.star)),
              borderRadius: BorderRadius.circular(100),
              //  color: Colors.amber,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.07,
            // vertical: SizeConfigs.getPercentageHeight(1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                  5,
                  (index) => Container(
                        height: 60,
                        width: 30,
                        color: index == 2
                            ? Colors.transparent
                            : Colors.transparent,
                        child: NavWidget(
                          label: index == 2 ? "" : data[index]["text"],
                          left: 28,
                          selected: index == 0 ? true : false,
                          image: data[index]["icon"],
                        ),
                      ))
            ],
          ),
        )
      ],
    );
  }
}
