import 'package:flutter/material.dart';
import 'package:luvit/config/color.dart';
import 'package:luvit/config/images.dart';
import 'package:luvit/views/homepage/home_view.dart';
import 'package:luvit/widget/item_widget.dart';
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
              height: 30,
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
            ).paddingBottom(1),
            Row(
              children: [
                Text(
                  "잭과분홍콩나물",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConfig.white,
                      fontSize: 25),
                ),
                Text(
                  " 25",
                  style: TextStyle(color: ColorConfig.gray, fontSize: 20),
                ),
              ],
            ),
            Text(
              "서로 아껴주고 힘이 되어줄 사람 찾아요",
              style: TextStyle(color: ColorConfig.gray, fontSize: 13),
            ),
            5.height,
            Text(
              "선릉으로 직장 다니고 있고 여행 좋아해요",
              style: TextStyle(color: ColorConfig.gray, fontSize: 13),
            ),
            5.height,
            Text(
              "이상한 이야기하시는 분 바로 차단입니다",
              style: TextStyle(color: ColorConfig.gray, fontSize: 13),
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

class card3 extends StatelessWidget {
  const card3({
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
              height: 30,
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
            ).paddingBottom(1),
            Row(
              children: [
                Text(
                  "잭과분홍콩나물",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConfig.white,
                      fontSize: 25),
                ),
                Text(
                  " 25",
                  style: TextStyle(color: ColorConfig.gray, fontSize: 20),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Color(0xffFF006B)),
                color: Color(0xff621133).withOpacity(0.6),
              ),
              height: 39,
              width: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    ImageConfig.lovePink,
                    height: 20,
                  ),
                  const Text(
                    "진지한 연애를 찾는 중",
                    style: TextStyle(
                        color: Color(0xffFF006B),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ).paddingBottom(7),
            Row(
              children: [
                const itemWidget(
                  img: ImageConfig.wine,
                  width: 100,
                  text: '전혀 안 함',
                ).paddingBottom(4.5),
                7.width,
                itemWidget(
                  img: ImageConfig.ciga,
                  width: 80,
                  text: '비흡연',
                ).paddingBottom(4.5),
              ],
            ),
            itemWidget(
              img: ImageConfig.muscle,
              width: 140,
              text: '매일 1시간 이상',
            ).paddingBottom(4.5),
            Row(
              children: [
                itemWidget(
                  img: ImageConfig.handIcon,
                  text: '만나는 걸 좋아함',
                  width: 140,
                ).paddingBottom(4.5),
                7.width,
                itemWidget(
                  img: '',
                  width: 60,
                  text: 'INFB',
                ).paddingBottom(4.5),
              ],
            ),
          ],
        ),
        Container().expand(),
        Image.asset(
          ImageConfig.loveCircle,
          height: 50,
        ).paddingTop(200)
      ],
    );
  }
}

class card1 extends StatelessWidget {
  const card1({
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
              height: 30,
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
                      fontSize: 25),
                ),
                Text(
                  " 25",
                  style: TextStyle(color: ColorConfig.gray, fontSize: 20),
                ),
              ],
            ),
            Text(
              "서울 · 2km 거리에 있음",
              style: TextStyle(color: ColorConfig.gray, fontSize: 15),
            ),
          ],
        ),
        Container().expand(),
        Image.asset(
          ImageConfig.loveCircle,
          height: 50,
        ).paddingTop(50)
      ],
    );
  }
}
