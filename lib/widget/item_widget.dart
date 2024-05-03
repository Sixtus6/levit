import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
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
        borderRadius: BorderRadius.circular(120),
        color: Colors.black,
      ),
      height: 35,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: img == ''
            ? [
                Text(
                  text,
                  style: const TextStyle(
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
                  style: const TextStyle(
                    color: Color(0xffF5F5F5),
                    fontSize: 13,
                  ),
                ),
              ],
      ),
    );
  }
}
