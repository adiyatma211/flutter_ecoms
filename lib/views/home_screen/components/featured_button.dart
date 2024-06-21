import 'package:flutter/material.dart';
import 'package:emart_app/consts/consts.dart';

Widget featuredButton({required String icon, required String title}) {
  return Row(
    children: [
      Image.network(
        icon,
        width: 65,
        fit: BoxFit.fill,
      ),
      SizedBox(width: 10),
      Text(
        title,
        style: TextStyle(
          fontFamily: semibold,
          color: darkFontGrey,
        ),
      ),
    ],
  )
      .box
      .width(200)
      .margin(const EdgeInsets.symmetric(horizontal: 4))
      .white
      .padding(const EdgeInsets.all(8))
      .roundedSM
      .outerShadowSm
      .make();
}
