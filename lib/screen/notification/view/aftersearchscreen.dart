import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/images.dart';
import 'package:social_mobile_app/constant/widget/backbutton.dart';
import 'package:social_mobile_app/constant/widget/textwidget.dart';
import '../controller/searchscreencontroller.dart';

class AfterSearchScreen extends StatefulWidget {
  const AfterSearchScreen({super.key});

  @override
  State<AfterSearchScreen> createState() => _AfterSearchScreenState();
}

class _AfterSearchScreenState extends State<AfterSearchScreen> {
  var searchscreencontrolller = Get.put(SearchScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics:const  BouncingScrollPhysics(),
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            height: 115,
            width: Get.width,
            decoration: const BoxDecoration(
                color: purple,
                border: Border(bottom: BorderSide(color: black,
                width: 2),),
                ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                children: [
                  backIconButton(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: 50,
                    width: Get.width * .80,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 0,
                            spreadRadius: 0,
                            color: black)
                      ],
                      border: Border.all(color: black),
                      color: grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          search1,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: Get.width * .50,
                          child:  const TextField(
                          
                            decoration:  InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                              hintStyle: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
       
          const SizedBox(
            height: 15,
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              shrinkWrap: true,
              itemCount: searchscreencontrolller.aftersearchlist.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: messageWidget2(
                      img: searchscreencontrolller.aftersearchlist[index]
                          ['img'],
                      name: searchscreencontrolller.aftersearchlist[index]
                          ['name'],
                    ),
                  ))
        ],
      ),
    );
  }

  Widget messageWidget2({img, name}) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(10.0),
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: grey,
          border: Border.all(
            color: black,
          ),
          boxShadow: const [
            BoxShadow(
                offset: Offset(4, 4),
                blurRadius: 0,
                spreadRadius: 0,
                color: black)
          ]),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: grey,
              boxShadow: const [
                BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: black)
              ],
              border: Border.all(color: black),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(img),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: Get.width * .35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kronaText(name, black, 14),
                robotoText("Request to connect", black.withValues(alpha:0.50), 14,
                    textoverflow: TextOverflow.ellipsis)
              ],
            ),
          ),
          const Spacer(),
            Container(
                    height: 40,
                    width:Get.width<415 ? 105: 130,
                    decoration: BoxDecoration(
                        border: Border.all(color: black),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 0,
                              spreadRadius: 0,
                              color: black)
                        ],
                        borderRadius: BorderRadius.circular(50),
                        color: pink),
                    child: Center(child: robotoboldText("Follow", black, 12)),
                  ),
        ],
      ),
    );
  }
  

}
