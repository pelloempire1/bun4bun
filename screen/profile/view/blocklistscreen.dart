import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/widget/backbutton.dart';
import 'package:social_mobile_app/constant/widget/text_widget.dart';
import '../controller/blcokcontrolller.dart';

class BlockScreen extends StatefulWidget {
  const BlockScreen({super.key});

  @override
  State<BlockScreen> createState() => _BlockScreenState();
}

class _BlockScreenState extends State<BlockScreen> {
   var blockcontroller = Get.put(BlockController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: purple,leading: backIconButton(),
      title: kronaText("Block List", black, 18),),
      body: ListView(physics:const  BouncingScrollPhysics(),children: [
              const  SizedBox(height: 15,),
          ListView.builder(
            physics:const  NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
              shrinkWrap: true,
              itemCount:blockcontroller.blocklist.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: messageWidget2(
                      img: blockcontroller.blocklist[index]['img'],
                      name: blockcontroller.blocklist[index]['name'],
                      id: blockcontroller.blocklist[index]['id']
                    ),
              ))
      ],),
    );
  }



    Widget messageWidget2({img, name,id}) {
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
                robotoText(id, black.withValues(alpha:0.50), 14,
                    textoverflow: TextOverflow.ellipsis)
              ],
            ),
          ),
          const Spacer(),
            Container(
                    height: 40,
                    width: Get.width<415 ? 105: 130,
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
                    child: Center(child: robotoboldText("Unblock", black, 14)),
                  ),
        ],
      ),
    );
  }
}