// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/images.dart';
import 'package:social_mobile_app/constant/widget/backbutton.dart';
import 'package:social_mobile_app/constant/widget/primarybutton.dart';
import 'package:social_mobile_app/constant/widget/text_widget.dart';
import 'package:social_mobile_app/constant/widget/textboxwidget.dart';

import '../controller/appprofilecontroller.dart';

class AddProfileScreen extends StatefulWidget {
  String title;
   AddProfileScreen({super.key,required this.title});

  @override
  State<AddProfileScreen> createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  var profilecontroller = Get.put(AddProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        surfaceTintColor: purple,
        backgroundColor: purple,
        leading: backIconButton(),
        title: kronaText(widget.title, black, 18),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  height: 1,
                  width: Get.width,
                  color: black,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Stack(children: [
                        Image.asset(
                          pp,
                          height: 100,
                          width: 100,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Image.asset(
                            edit,
                            height: 30,
                            width: 30,
                          ),
                        )
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      textboxWidget(hinttext: "Name", textboxcolor: mint),
                      const SizedBox(
                        height: 15,
                      ),
                      customtextbox(
                          hinttext: "Birthday",
                          textboxcolor: mint,
                          suffixicon: const Icon(
                            Icons.calendar_today_outlined,
                            color: black,
                            size: 18,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      customtextbox(
                          hinttext: "Gender",
                          textboxcolor: mint,
                          suffixicon: const Icon(
                            Icons.arrow_drop_down,
                            color: black,
                            size: 30,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(2, 2),
                                blurRadius: 0,
                                spreadRadius: 0,
                                color: black)
                          ],
                        ),
                        child: TextFormField(
                          onChanged: (value) {
                            profilecontroller.length.value = value.length;
                          },
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: black,
                              fontFamily: "Roboto"),
                          decoration: InputDecoration(
                            fillColor: mint,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(color: black)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(color: black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(color: black)),
                            hintText: "Bio",
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: black,
                              fontFamily: "Roboto",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 05,
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: Obx(() => robotoboldText(
                              "${profilecontroller.length.value.toString()}/200",
                              black,
                              14),
                              ),
                              ),
                      SizedBox(
                        height: Get.height * .50,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: primaryButton(text: "Save"),
          )
        ],
      ),
    );
  }

  Widget customtextbox(
      {hinttext,
      maxline = 1,
      controller,
      borderradius = 10.0,
      textboxcolor = grey,
      suffixicon}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 0,
              spreadRadius: 0,
              color: black)
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxline,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: black,
            fontFamily: "Roboto"),
        decoration: InputDecoration(
          suffixIcon: suffixicon,
          fillColor: textboxcolor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: black)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: black)),
          hintText: hinttext,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: black,
            fontFamily: "Roboto",
          ),
        ),
      ),
    );
  }
}
