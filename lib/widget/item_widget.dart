import 'package:flutter/material.dart';

class itemWidget extends StatelessWidget {
  const itemWidget({
    super.key,
    required this.width,
    required this.img,
    required this.text,
  });
  final double width;
  final String img;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.black,
      ),
      height: 30,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: img == ''
            ? [
                Text(
                  text,
                  style: TextStyle(
                    color: Color(0xffF5F5F5),
                    fontSize: 13,
                  ),
                ),
              ]
            : [
                Image.asset(
                  img,
                  height: 18,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Color(0xffF5F5F5),
                    fontSize: 13,
                  ),
                ),
              ],
      ),
    );
  }
}
