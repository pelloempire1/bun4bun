import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/images.dart';
import 'package:social_mobile_app/screen/bottomnavigation/controller/bottomcontroller.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  var bottomcontroller = Get.put(BottomController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Obx(() => bottomcontroller.bottomlist
                .elementAt(bottomcontroller.selectedindex.value)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 70,
              width: Get.width,
              decoration: BoxDecoration(
                border: Border.all(color: black),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(4, 4),
                      blurRadius: 0,
                      spreadRadius: 0,
                      color: black)
                ],
                color: grey,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Obx(
                ()=>Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    bottomWidget(img1: sb1, img2: bo1, index: 0),
                    bottomWidget(img1: sb2, img2: bo2, index: 1),
                    bottomWidget(img1: sb3, img2: bo3, index: 2),
                    bottomWidget(img1: sb4, img2: bo4, index: 3),
                    bottomWidget(img1: sb5, img2: bo5, index: 4),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomWidget({img1,img2,index}){
    return   GestureDetector(
      onTap: (){
    bottomcontroller.selectedindex.value  = index;
      },
      child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        boxShadow:  [
                       BoxShadow(
                        offset:const Offset(2, 2),
                        blurRadius: 0,
                        spreadRadius: 0,
                        color:bottomcontroller.selectedindex.value ==index ? black:grey)
                        ],
                        color:bottomcontroller.selectedindex.value ==index? pink :grey,
                          border: Border.all(color: bottomcontroller.selectedindex.value ==index ? black:grey),
                          borderRadius: BorderRadius.circular(60)),
                   child: Center(child: SvgPicture.asset(bottomcontroller.selectedindex.value ==index ? img1:img2)), ),
    );
  }
}
