import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/images.dart';
import 'package:social_mobile_app/screen/messge/controller/messagecontroller.dart';
import 'package:social_mobile_app/screen/messge/view/messagewritescreen.dart';

import '../../../constant/color.dart';
import '../../../constant/widget/textwidget.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  var messagecontroller = Get.put(MessageController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: mint,
         appBar:AppBar(automaticallyImplyLeading: false,title: kronaText("Message", black, 18),backgroundColor: mint,),
         body: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16.0),
           child: ListView(children: [
            Obx(
              ()=> messagecontroller.show.value == false ? 
                  GestureDetector(
                        onTap: (){
             messagecontroller.show.value =true;
                        },
                        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: Get.height*.15,),
                Image.asset(nomessage,height: 168,width: 168,),
                const SizedBox(height: 10,),
                kronaText("No Messages Yet", black, 16),
                   const SizedBox(height: 10,),
                  robotoboldText(
                      "Feeling a little empty here. Start a chat and fill this space with good vibes!",
                      black.withValues(alpha:0.5),
                      16,maxline: 2,align: TextAlign.center),
              ],
                        ),
                      ):
              ListView.builder(
                shrinkWrap: true,
                itemCount: messagecontroller.messagelist.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: GestureDetector(
                    onTap: (){
                      Get.to(()=>const MessageWriteScreen());
                    },
                    child: messageWidget(
                        img: messagecontroller.messagelist[index]['img'],
                        name: messagecontroller.messagelist[index]['title'],
                        sub: messagecontroller.messagelist[index]['sub'],
                        time: messagecontroller.messagelist[index]['time']),
                  ),
                ),
              ),
            )
           ],),
         ),
    );
  }


  Widget messageWidget({img,name,sub,time}){
    return          Container(
              height: 80,
              padding:const EdgeInsets.all(10.0),
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
                                  color: black)]),
                                  child: Row(children: [
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
                 const SizedBox(width: 10,),
                  SizedBox(
                    width: 
                    Get.width*.55,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      kronaText(name, black, 14),
                    robotoText(sub, black.withValues(alpha:0.50), 14,textoverflow: TextOverflow.ellipsis)
                    ],),
                  ),
                 const Spacer(),
                  robotoboldText(time, black, 12)
                                  ],),
                                  );
  }
}