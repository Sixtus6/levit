import 'package:flutter/material.dart';
import 'package:luvit/config/color.dart';
import 'package:luvit/config/images.dart';
import 'package:luvit/widget/navigation_items.dart';

class customNavBar extends StatelessWidget {
  const customNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    width: 2, color: ColorConfig.shade.withOpacity(0.5))),
          ),
        ),
        Container(
          height: 90,
          decoration: BoxDecoration(
              color: ColorConfig.shade.withOpacity(0.5),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: Container(
            width: double.infinity,
            height: 78,
            margin: EdgeInsets.only(top: 3),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
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
                border: Border.all(width: 2, color: Colors.black)),
          ),
        ),
        Positioned(
          top: 1,
          child: Container(
            width: 99,
            height: 99,
            decoration: BoxDecoration(
              image: const DecorationImage(image: AssetImage(ImageConfig.star)),
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
          left: 286,
          //selected: true,
          image: ImageConfig.chatIcon,
        ),
        NavWidget(
          label: '마이',
          left: 365,
          //selected: true,
          image: ImageConfig.personIcon,
        ),
      ],
    );
  }
}
