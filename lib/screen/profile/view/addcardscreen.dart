import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/images.dart';
import 'package:social_mobile_app/constant/widget/backbutton.dart';
import 'package:social_mobile_app/constant/widget/primarybutton.dart';
import 'package:social_mobile_app/constant/widget/textwidget.dart';
import 'package:social_mobile_app/constant/widget/textboxwidget.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: purple,
        leading: backIconButton(),
        title: kronaText("Add Card",black , 18),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: ListView(children: [
              Container(height: 02,width: Get.width,color: black,),
             const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Image.asset(cc),
                      const SizedBox(height: 15,),
                          textboxWidget(hinttext: "Card Name",textboxcolor: mint),
                                const SizedBox(
                                  height: 15,
                                ),
                                textboxWidget(hinttext: "Card Number",textboxcolor: mint),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: Get.width * .42,
                                        child: textboxWidget(hinttext: "Expiry Date",textboxcolor: mint)),
                                    SizedBox(
                                      width: Get.width * .42,
                                      child: textboxWidget(hinttext: "CVV",textboxcolor: mint),
                                    ),
                                  ],
                                ),
                  ],
                ),
              )
            ],),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: primaryButton(text: "Add Card",),
          )
        ],
      ),
    );
  }
}