import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/screen/notification/controller/notificationcontroller.dart';

import '../../../constant/color.dart';
import '../../../constant/images.dart';
import '../../../constant/widget/text_widget.dart';
import 'followrequestscreen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var notificationcontroller = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mint,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mint,
        title: kronaText("Notification", black, 18),
        actions: [InkWell(onTap: (){
          Get.to(()=>const FollowRequestScreen());
        },child: kronaText("Request ", black, 12))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
             Obx(
               ()=> notificationcontroller.show.value == false ?
                           GestureDetector(
                onTap: (){
               notificationcontroller.show.value =true;
                },
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * .20,
                  ),
                  Image.asset(
                    bell,
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  kronaText("No Notifications Yet", black, 16),
                  const SizedBox(
                    height: 15,
                  ),
                  robotoboldText(
                      "You’re all caught up! Stay tuned for updates and \nalerts here.",
                      black.withValues(alpha:0.50),
                      16,
                      maxline: 2,
                      align: TextAlign.center),
                ],
                          ),
                           )
                           :
                           Column(
                children: [
                  messageWidget(
                      img: n1,
                      name: "Olivia Brooks, 22",
                      sub: "Liked your post",
                      time: "04:30 PM"),
                        const SizedBox(
                height: 15,
                           ),
                           messageWidget2(
                  img: n1,
                  name: "Lily Fernandez",
                  sub: "Request to connect",
                  time: "Mon"),
                    const SizedBox(
                height: 15,
                           ),
                           messageWidget3(
                   img: n3,
                  name: "Sophia Chen",
                  sub: "Sent GIF & Animation",
                  time: "Tue"
                           ),
                    const SizedBox(
                height: 15,
                           ),
               messageWidget2(
                  img: n4,
                  name: "Grace Hamilton",
                  sub: "Request to connect",
                  time: "Tue"),
                ],
                
                           ),
             ),
          
          ],
        ),
      ),
    );
  }

  Widget messageWidget({img, name, sub, time}) {
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
            width: Get.width * .55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kronaText(name, black, 14),
                robotoText(sub, black.withValues(alpha:0.50), 14,
                    textoverflow: TextOverflow.ellipsis)
              ],
            ),
          ),
          const Spacer(),
          robotoboldText(time, black, 12)
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
                robotoText(sub, black.withValues(alpha:0.50), 14,
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
             const SizedBox(height: 05,),
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


    Widget messageWidget3({img, name, sub, time}) {
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
                robotoText(sub, black.withValues(alpha:0.50), 14,
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
             const SizedBox(height: 05,),
             Image.asset(n5,height: 20,width: 50,)
            ],
          )
        ],
      ),
    );
  }
}
