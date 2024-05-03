import 'package:flutter/material.dart';
import 'package:luvit/config/color.dart';
import 'package:luvit/config/images.dart';
import 'package:nb_utils/nb_utils.dart';

class card2 extends StatelessWidget {
  const card2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.black,
              ),
              height: 35,
              width: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    ImageConfig.starIcon,
                    height: 20,
                  ),
                  Text(
                    "29,930",
                    style: TextStyle(color: ColorConfig.white, fontSize: 15),
                  ),
                ],
              ),
            ).paddingBottom(10),
            Row(
              children: [
                Text(
                  "잭과분홍콩나물",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConfig.white,
                      fontSize: 28),
                ),
                Text(
                  " 25",
                  style: TextStyle(color: ColorConfig.gray, fontSize: 25),
                ),
              ],
            ),
            Text(
              "서로 아껴주고 힘이 되어줄 사람 찾아요",
              style: TextStyle(color: ColorConfig.gray, fontSize: 15),
            ),
            5.height,
            Text(
              "선릉으로 직장 다니고 있고 여행 좋아해요",
              style: TextStyle(color: ColorConfig.gray, fontSize: 15),
            ),
            5.height,
            Text(
              "이상한 이야기하시는 분 바로 차단입니다",
              style: TextStyle(color: ColorConfig.gray, fontSize: 15),
            ),
          ],
        ),
        Container().expand(),
        Image.asset(
          ImageConfig.loveCircle,
          height: 50,
        ).paddingTop(100)
      ],
    );
  }
}
