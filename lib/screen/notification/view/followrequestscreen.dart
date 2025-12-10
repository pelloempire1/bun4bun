import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/widget/backbutton.dart';
import 'package:social_mobile_app/constant/widget/textwidget.dart';
import '../controller/followrequestcontroller.dart';

class FollowRequestScreen extends StatefulWidget {
  const FollowRequestScreen({super.key});

  @override
  State<FollowRequestScreen> createState() => _FollowRequestScreenState();
}

class _FollowRequestScreenState extends State<FollowRequestScreen> {
  var followcontroller = Get.put(FollowController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: purple,
        backgroundColor: purple,
        leading: backIconButton(),
        title: kronaText("Follow Request", black, 18),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            height: 2,
            width: Get.width,
            color: black,
          ),
          const SizedBox(
            height: 15,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            shrinkWrap: true,
            itemCount: followcontroller.followrequestlist.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: messageWidget2(
                  img: followcontroller.followrequestlist[index]['img'],
                  name: followcontroller.followrequestlist[index]['name'],
                  sub: "Request to connect",
                  time: followcontroller.followrequestlist[index]['time']),
            ),
          )
        ],
      ),
    );
  }

  Widget messageWidget2({img, name, sub, time}) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              robotoboldText(time, black, 12),
              const SizedBox(
                height: 05,
              ),
              Row(
                children: [
                  Container(
                    height: 28,
                    width: 70,
                    decoration: BoxDecoration(
                        border: Border.all(color: black),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 0,
                              spreadRadius: 0,
                              color: black)
                        ],
                        borderRadius: BorderRadius.circular(50),
                        color: purple),
                    child: Center(child: robotoboldText("Confirm", black, 12)),
                  ),
                  const SizedBox(
                    width: 05,
                  ),
                  Container(
                    height: 28,
                    width: 70,
                    decoration: BoxDecoration(
                        border: Border.all(color: black),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 0,
                              spreadRadius: 0,
                              color: black)
                        ],
                        borderRadius: BorderRadius.circular(50),
                        color: mint),
                    child: Center(child: robotoboldText("Delete", black, 12)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
