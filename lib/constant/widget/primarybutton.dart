import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/widget/textwidget.dart';


Widget primaryButton({
  color = pink,
  bordercolor = black,
  textcolor = black,
  onpress,
  text,
}) {
  return GestureDetector(
    onTap: onpress,
    child: Container(
      height: 50,
      width: Get.width*.60,
      decoration: BoxDecoration(
         boxShadow:const [
                    BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 0,
                        spreadRadius: 0,
                        color: black)
                  ],
          borderRadius: BorderRadius.circular(50),
          color: color,
          border: Border.all(color: bordercolor)),
      child: Center(child: robotoboldText(text, textcolor, 16)),
    ),
  );
}
