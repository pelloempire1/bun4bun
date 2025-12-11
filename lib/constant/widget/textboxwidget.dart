import 'package:flutter/material.dart';
import 'package:social_mobile_app/constant/color.dart';


//  final ThemeController themeController = Get.find();
Widget textboxWidget({
  hinttext,
  maxline = 1,
  controller,
  borderradius = 10.0,
  textboxcolor = grey
}) {
  return Container(
    decoration:  BoxDecoration(
      borderRadius: BorderRadius.circular(50),
       boxShadow:const [
                    BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 0,
                        spreadRadius: 0,
                        color: black)
                  ],
    ),
    child: TextFormField(
      controller: controller,
      maxLines: maxline,
      style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: black,
          fontFamily: "Roboto"),
      decoration: InputDecoration(
        
        fillColor: textboxcolor,
        filled: true,
        border: OutlineInputBorder(
        
            borderRadius: BorderRadius.circular(50),
            borderSide:  const BorderSide(color: black)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide:  const BorderSide(color: black)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: black)),
        hintText: hinttext,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: black,
          fontFamily: "Roboto",
        ),
      ),
    ),
  );
}
