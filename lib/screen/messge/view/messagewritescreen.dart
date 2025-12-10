import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/images.dart';
import 'package:social_mobile_app/constant/widget/backbutton.dart';
import 'package:social_mobile_app/constant/widget/textwidget.dart';
import 'package:social_mobile_app/screen/messge/view/otherprofileblank.dart';

import '../controller/messagecontroller.dart';

class MessageWriteScreen extends StatefulWidget {
  const MessageWriteScreen({super.key});

  @override
  State<MessageWriteScreen> createState() => _MessageWriteScreenState();
}

class _MessageWriteScreenState extends State<MessageWriteScreen> {
  var messagecontroller = Get.put(MessageController());
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            bg,
            fit: BoxFit.fill,
            width: Get.width,
            height: Get.height,
          ),
          topwidget(),
          Positioned(
            top: 100,
            child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: ClipRect(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 20,
                            width: 60,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 0,
                                      spreadRadius: 0,
                                      color: black)
                                ],
                                borderRadius: BorderRadius.circular(20),
                                color: pink),
                            child:
                                Center(child: robotoText("Today", black, 12)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  height: 65,
                                  width: 130,
                                  decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(4, 4),
                                            blurRadius: 0,
                                            spreadRadius: 0,
                                            color: black)
                                      ],
                                      color: purple,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  child: robotoboldText(
                                      "Hey Olivia! \nHow's it going? ",
                                      black,
                                      14,
                                      maxline: 2),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                robotoText(
                                    "04:04 PM", black.withValues(alpha:0.50), 12)
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: Get.width * .70,
                              height: 150,
                              decoration: BoxDecoration(
                                border: Border.all(color: black),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(4, 4),
                                      blurRadius: 0,
                                      spreadRadius: 0,
                                      color: black)
                                ],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.asset(
                                mw1,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  height: 40,
                                  width: Get.width * .65,
                                  decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(4, 4),
                                            blurRadius: 0,
                                            spreadRadius: 0,
                                            color: black)
                                      ],
                                      color: mint,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          topLeft: Radius.circular(10))),
                                  child: robotoboldText(
                                      "Look I have cut my hair ..💗", black, 14,
                                      maxline: 2),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    robotoText("04:04 PM",
                                        black.withValues(alpha:0.50), 12),
                                    const SizedBox(
                                      width: 05,
                                    ),
                                    SvgPicture.asset(tick)
                                  ],
                                )
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  height: 40,
                                  width: Get.width * .65,
                                  decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(4, 4),
                                            blurRadius: 0,
                                            spreadRadius: 0,
                                            color: black)
                                      ],
                                      color: purple,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  child: robotoboldText(
                                      "Wooww..! You look so Beautiful..😎",
                                      black,
                                      14,
                                      maxline: 2),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                robotoText(
                                    "04:05 PM", black.withValues(alpha:0.50), 12),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(10.0),
                                    height: 60,
                                    width: Get.width < 415
                                        ? Get.width * .70
                                        : Get.width * .65,
                                    decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(4, 4),
                                              blurRadius: 0,
                                              spreadRadius: 0,
                                              color: black)
                                        ],
                                        color: mint,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            topLeft: Radius.circular(10))),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
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
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Image.asset(m1),
                                        ),
                                        const Icon(
                                          Icons.play_arrow_rounded,
                                          size: 30,
                                        ),
                                        Container(
                                          height: 8,
                                          width: 8,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: black),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 02.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: Get.width * .40,
                                                child: const DottedLine(
                                                  direction: Axis.horizontal,
                                                  alignment:
                                                      WrapAlignment.center,
                                                  lineLength: double.infinity,
                                                  lineThickness: 1.0,
                                                  dashLength: 02.0,
                                                  dashColor: Colors.black,
                                                  dashRadius: 0.0,
                                                  dashGapLength: 4.0,
                                                  dashGapColor:
                                                      Colors.transparent,
                                                  dashGapRadius: 0.0,
                                                ),
                                              ),
                                              robotoText('1:03', black, 12)
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    robotoText("04:06 PM",
                                        black.withValues(alpha:0.50), 12),
                                    const SizedBox(
                                      width: 05,
                                    ),
                                    SvgPicture.asset(tick)
                                  ],
                                )
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(10.0),
                                    height: 60,
                                    width: Get.width < 415
                                        ? Get.width * .70
                                        : Get.width * .65,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(4, 4),
                                            blurRadius: 0,
                                            spreadRadius: 0,
                                            color: black)
                                      ],
                                      color: purple,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
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
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Image.asset(m2),
                                        ),
                                        const Icon(
                                          Icons.play_arrow_rounded,
                                          size: 30,
                                        ),
                                        Container(
                                          height: 8,
                                          width: 8,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: black),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 02.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: Get.width * .40,
                                                child: const DottedLine(
                                                  direction: Axis.horizontal,
                                                  alignment:
                                                      WrapAlignment.center,
                                                  lineLength: double.infinity,
                                                  lineThickness: 1.0,
                                                  dashLength: 02.0,
                                                  dashColor: Colors.black,
                                                  dashRadius: 0.0,
                                                  dashGapLength: 4.0,
                                                  dashGapColor:
                                                      Colors.transparent,
                                                  dashGapRadius: 0.0,
                                                ),
                                              ),
                                              robotoText('00:59', black, 12)
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    robotoText("04:07 PM",
                                        black.withValues(alpha:0.50), 12),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 200,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Obx(
              () => Container(
                height: messagecontroller.messagevisible.value
                    ? Get.height * .60
                    : 100,
                width: Get.width,
                decoration: const BoxDecoration(color: grey),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 50,
                          width: Get.width * .75,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(4, 4),
                                    blurRadius: 0,
                                    spreadRadius: 0,
                                    color: black),
                              ],
                              borderRadius: BorderRadius.circular(30),
                              color: mint),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    messagecontroller.messagevisible.value =
                                        true;
                                  },
                                  icon: SvgPicture.asset(smile)),
                              const SizedBox(
                                width: 08,
                              ),
                              SizedBox(
                                  width: Get.width * .45,
                                  child: TextField(
                                    focusNode: _focusNode,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type Your Message",
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
                          child: const Center(
                            child: Icon(Icons.mic_none_outlined),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Obx(
                      () => messagecontroller.messagevisible.value
                          ? Column(
                              children: [
                                Obx(
                                  () => Container(
                                    height: 40,
                                    width: Get.width,
                                    color: greycontainer,
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            messagecontroller
                                                .messagevisible.value = false;
                                          },
                                          child: SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: Image.asset(smallback),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            messagecontroller
                                                .selectedaction.value = 0;
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: pink,
                                                border: Border.all(
                                                    color: messagecontroller
                                                                .selectedaction
                                                                .value ==
                                                            0
                                                        ? black
                                                        : pink)),
                                            height: 30,
                                            width: 100,
                                            child: Center(
                                                child:
                                                    SvgPicture.asset(sticker)),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            messagecontroller
                                                .selectedaction.value = 1;
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: pink,
                                                border: Border.all(
                                                    color: messagecontroller
                                                                .selectedaction
                                                                .value ==
                                                            1
                                                        ? black
                                                        : pink)),
                                            height: 30,
                                            width: 100,
                                            child: Center(
                                                child: SvgPicture.asset(gif)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => messagecontroller
                                              .selectedaction.value ==
                                          0
                                      ? Container(
                                          height: Get.height * .60 - 140,
                                          width: Get.width,
                                          decoration:
                                              const BoxDecoration(color: grey),
                                          child: GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemCount: messagecontroller
                                                  .stickerlist.length,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      mainAxisSpacing: 10,
                                                      mainAxisExtent: 130,
                                                      crossAxisSpacing: 10,
                                                      crossAxisCount: 4),
                                              itemBuilder: (context, index) =>
                                                  stickerWidget(
                                                      img: messagecontroller
                                                              .stickerlist[index]
                                                          ['img'],
                                                      price: messagecontroller
                                                              .stickerlist[
                                                          index]['price'])),
                                        )
                                      : Container(
                                          height: Get.height * .60 - 140,
                                          width: Get.width,
                                          decoration:
                                              const BoxDecoration(color: grey),
                                          child: GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemCount: messagecontroller
                                                  .giflist.length,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      mainAxisSpacing: 10,
                                                      mainAxisExtent: 130,
                                                      crossAxisSpacing: 10,
                                                      crossAxisCount: 4),
                                              itemBuilder: (context, index) =>
                                                  stickerWidget(
                                                      img: messagecontroller
                                                              .giflist[index]
                                                          ['img'],
                                                      price: messagecontroller
                                                              .giflist[index]
                                                          ['price'])),
                                        ),
                                ),
                              ],
                            )
                          : Container(),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget stickerWidget({price, img}) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: Get.width * .24,
          child: Image.asset(img),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 20,
          width: 50,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 0,
                spreadRadius: 0,
                color: black),
          ], borderRadius: BorderRadius.circular(20), color: mint),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                coin1,
                height: 12,
                width: 12,
              ),
              const SizedBox(
                width: 2,
              ),
              robotoText(price, black, 12)
            ],
          ),
        ),
      ],
    );
  }

  Widget topwidget() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          height: 100,
          width: Get.width,
          color: purple,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                backIconButton(),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const OtherProfileBlackScreen());
                  },
                  child: Container(
                    height: 40,
                    width: 40,
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
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Image.asset(m1),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kronaText("Olivia Brooks, 22", black, 12),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 6,
                          width: 6,
                          decoration: const BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle),
                        ),
                        const SizedBox(
                          width: 05,
                        ),
                        robotoText("Online", black, 14),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    chatmenu();
                  },
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: mint,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 0,
                              spreadRadius: 0,
                              color: black)
                        ]),
                    child: Center(
                      child: SvgPicture.asset(menu),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 2,
          width: Get.width,
          color: black,
        ),
      ],
    );
  }

  chatmenu() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        child: Container(
          height: 200,
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              paymentWidget(index: 0, name: "Profile"),
              paymentWidget(index: 1, name: "Block"),
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
        messagecontroller.selectedmenu.value = index;
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
                        color: messagecontroller.selectedmenu.value == index
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
}
