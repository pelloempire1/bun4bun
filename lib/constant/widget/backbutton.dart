import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';


Widget backIconButton({color = grey}) {

  return IconButton(
    onPressed: () {
      Get.back();
    },
    icon: Container(
        height: 40,
        width: 40,
    decoration: BoxDecoration(shape: BoxShape.circle,color: color,
    border: Border.all(color: black),
    boxShadow:const  [  BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 0,
                              spreadRadius: 0,
                              color: black)]),
        child: const  Center(
          child:
          Icon(Icons.arrow_back,color: black,),
        )),
  );
}