

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../color.dart';
import '../images.dart';

Widget backgroundWidget(){
return SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: Get.height * .30,
                    width: Get.width,
                    color: purple,
                  ),
                  Container(height: 2,width: Get.width,color: black,)
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: Get.height * .70,
                    width: Get.width,
                    color: grey,
                  ),
                  Positioned(bottom: 0,child: SvgPicture.asset(ele1)),
                   Positioned(right: 0,child: SvgPicture.asset(ele2))
                ],
              )
            ],
          ),
          );
}
