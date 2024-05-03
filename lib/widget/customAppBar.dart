import 'package:flutter/material.dart';
import 'package:luvit/config/color.dart';
import 'package:luvit/config/images.dart';
import 'package:nb_utils/nb_utils.dart';

class customAppbar extends StatelessWidget {
  const customAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          ImageConfig.map2,
          height: 35,
        ),
        const Text(
          "매일 새로운 친구들을 소개시켜드려요",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Container().expand(),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: ColorConfig.shade),
            color: Colors.black,

            borderRadius: BorderRadius.circular(100),
            // color: Colors.black,
          ),
          height: 35,
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                ImageConfig.starIcon,
                color: ColorConfig.primary,
                height: 18,
              ),
              Text(
                "323,333",
                style: TextStyle(
                  color: Color(0xffF5F5F5),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          ImageConfig.bell,
          height: 42,
        ),
      ],
    );
  }
}
