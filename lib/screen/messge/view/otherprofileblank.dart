import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/widget/primarybutton.dart';
import 'package:social_mobile_app/screen/messge/controller/profilecontroller.dart';
import 'package:social_mobile_app/screen/messge/view/messagewritescreen.dart';

import '../../../constant/images.dart';
import '../../../constant/widget/backbutton.dart';
import '../../../constant/widget/textwidget.dart';
import 'postdetailscreen.dart';

class OtherProfileBlackScreen extends StatefulWidget {
  const OtherProfileBlackScreen({super.key});

  @override
  State<OtherProfileBlackScreen> createState() =>
      _OtherProfileBlackScreenState();
}

class _OtherProfileBlackScreenState extends State<OtherProfileBlackScreen> {
  var profilecontroller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(0),
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 150,
                width: Get.width,
                decoration: const BoxDecoration(
                    color: purple,
                    border:
                        Border(bottom: BorderSide(color: black, width: 2.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      backIconButton(),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kronaText("@OlivaBrook... ", black, 18),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          profilemenu();
                        },
                        icon: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                                color: mint,
                                shape: BoxShape.circle,
                                boxShadow:  [
                                  BoxShadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 0,
                                      spreadRadius: 0,
                                      color: black)
                                ]),
                            child: Center(child: SvgPicture.asset(menu))),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: Get.width * .50 - 50,
                right: Get.width * .50 - 50,
                bottom: -50,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(4, 4),
                          blurRadius: 0,
                          spreadRadius: 0,
                          color: black)
                    ],
                    border: Border.all(
                      color: black,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(pb),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kronaText("Olivia Brooks, 22", black, 14),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(check)
                ],
              ),
              const SizedBox(
                height: 05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(location),
                  const SizedBox(
                    width: 05,
                  ),
                  robotoText("Berlin", black.withValues(alpha:0.50), 14),
                ],
              ),
              const SizedBox(
                height: 05,
              ),
              robotoText("Here to connect and create memories!",
                  black.withValues(alpha:0.50), 14)
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              boxWidget(title: "Visitors", value: "35"),
              boxWidget(title: "Follower", value: "253"),
              boxWidget(title: "Following", value: "1k"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: Get.width * .40,
                child: primaryButton(text: "Follow"),
              ),
              SizedBox(
                width: Get.width * .40,
                child: primaryButton(text: "Message",onpress: (){
                  Get.to(()=>const MessageWriteScreen());
                }),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            height: 1,
            color: black,
          ),
          Obx(
            () => profilecontroller.show.value == false
                ? GestureDetector(
                    onTap: () {
                      profilecontroller.show.value = true;
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * .15,
                        ),
                        Image.asset(
                          np,
                          height: 150,
                          width: 130,
                        ),
                        SizedBox(
                          height: Get.height * .15,
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GridView.builder(
                      itemCount: profilecontroller.profilelist.length,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 15,
                              mainAxisExtent: 120,
                              mainAxisSpacing: 15.0),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: (){
                          Get.to(()=>const PostDetailScreen());
                        },
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          height: 120,
                          width: Get.width * .28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: black),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(4, 4),
                                  blurRadius: 0,
                                  spreadRadius: 0,
                                  color: black),
                            ],
                          ),
                          child: Image.asset(
                            profilecontroller.profilelist[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  profilemenu() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        child: Container(
          height: 150,
          width: Get.width,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20.0),
          decoration: BoxDecoration(
            border: Border.all(color: black),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(5, 5),
                  blurRadius: 0,
                  spreadRadius: 0,
                  color: black)
            ],
            borderRadius: BorderRadius.circular(40),
            color: grey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              paymentWidget(index: 1, name: "Block"),
              const SizedBox(
                height: 10,
              ),
              paymentWidget(index: 2, name: "Report"),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentWidget({name, index}) {
    return GestureDetector(
      onTap: () {
        profilecontroller.selectedmenu.value = index;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 0,
                spreadRadius: 0,
                color: black)
          ],
          border: Border.all(color: black),
          borderRadius: BorderRadius.circular(100),
          color: pink,
        ),
        child: Row(
          children: [
            robotoboldText(name, black, 14),
            const Spacer(),
            Obx(
              () => Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(color: black),
                    shape: BoxShape.circle,
                    color: grey),
                child: Center(
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: profilecontroller.selectedmenu.value == index
                            ? black
                            : grey,
                        shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget boxWidget({title, value}) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        color: grey,
        boxShadow: const [
          BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 0,
              spreadRadius: 0,
              color: black),
        ],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: black),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          kronaText(value, black, 14),
          robotoText(title, black.withValues(alpha:0.50), 12)
        ],
      ),
    );
  }
}
