import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/widget/backbutton.dart';
import 'package:social_mobile_app/constant/widget/textwidget.dart';

import '../../../constant/images.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: purple,
        leading: backIconButton(),
        title: kronaText("Posts", black, 18),
      ),
      body: ListView(children: [
           Container(
                    height: 2,
                    width: Get.width,
                    color: black,
                  ),
                  discover1(image: pd1),
          discover1(image: pd2),
          discover1(image: pd3),
          discover1(image: pd4),
          discover1(image: pd5),
          discover1(image: pd6),

      ],),
    );
  }

   Widget discover1({image}) {
    return Container(
      margin:const  EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(12),
      height: 435,
      width: Get.width,
      decoration: BoxDecoration(
        
        border: Border.all(color: black),
        boxShadow: const [
          BoxShadow(
              offset: Offset(5, 5),
              blurRadius: 0,
              spreadRadius: 0,
              color: black),
        ],
        color: purple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                d1,
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              kronaText("Olivia Brooks, 22", black, 14),
              
              
             
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            width: Get.width,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: black),
              ],
              border: Border.all(color: black),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SvgPicture.asset(heart),
              const SizedBox(
                width: 05,
              ),
              robotoText("26", black, 14),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                  onTap: () {
                commentSheet();
                  },
                  child: SvgPicture.asset(comment)),
              const SizedBox(
                width: 05,
              ),
              robotoText("05", black, 14),
            
            
            ],
          ),
          const SizedBox(height: 05,),
          Row(children: [
            Image.asset(liked,height: 20,width: 50,),

            const SizedBox(width: 05,),
          robotoboldText("Liked by Olivia Brooks and others", black, 14)
          ],),
          const SizedBox(height: 05,),
          robotoText(
              "Embracing every moment, creating memories, and connecting with amazing people along the way.",
              black,
              14,
              maxline: 2,
              textoverflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
commentSheet() {
    Get.bottomSheet(Container(
      height: 450,
      width: Get.width,
      decoration: const BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              kronaText("Comment", black, 14),
              commentWidget(
                  comment:
                      "This is such a beautiful moment! You have an amazing way of capturing the vibe – can’t wait to see what you share next!⭐🤩",
                  img: c1,
                  isliked: false,
                  likecount: "17",
                  name: "Robert Turner",
                  time: "30 min ago"),
              commentWidget(
                  comment:
                      "This looks amazing! Can't wait to see more from you!❤💕 The colors and mood are mesmerizing.⭐🤩",
                  img: c2,
                  isliked: true,
                  likecount: "10",
                  name: "Emma Wilson",
                  time: "20 min ago"),
              const SizedBox(
                height: 10,
              ),
              commentWidget(
                  comment: "Incredible! Thanks for sharing this with us!.😍🥰",
                  img: c3,
                  isliked: true,
                  likecount: "10",
                  name: "Amelia Brooks",
                  time: "20 min ago"),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 2,
                width: Get.width,
                color: black,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    width: Get.width * .80,
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(
                          offset: Offset(4, 4),
                          blurRadius: 0,
                          spreadRadius: 0,
                          color: black),
                    ], borderRadius: BorderRadius.circular(30), color: mint),
                    child: Row(
                      children: [
                        SvgPicture.asset(smile),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            width: Get.width * .50,
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Write comment...",
                                  hintStyle: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 12,
                                  )),
                            )),
                        const Spacer(),
                        SvgPicture.asset(camera),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: Offset(4, 4),
                          blurRadius: 0,
                          spreadRadius: 0,
                          color: black),
                    ], shape: BoxShape.circle, color: pink),
                    child: Center(child: SvgPicture.asset(share)),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    ));
  }

    Widget commentWidget({img, name, time, likecount, isliked, comment}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: black),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(2, 2),
                          blurRadius: 0,
                          spreadRadius: 0,
                          color: black),
                    ]),
                child: Image.asset(
                  img,
                  height: 40,
                  width: 40,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kronaText(name, black, 12),
                    robotoText(time, black.withValues(alpha:0.50), 12)
                  ],
                ),
              ),
              const Spacer(),
              robotoText(likecount, black, 12),
              const SizedBox(
                width: 05,
              ),
              isliked
                  ? SvgPicture.asset(heartfill)
                  : SvgPicture.asset(greyheart)
            ],
          ),
          robotoText(comment, black, 14, maxline: 3),
        ],
      ),
    );
  }

}