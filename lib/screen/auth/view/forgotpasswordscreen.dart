
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:social_mobile_app/constant/color.dart';

import 'package:social_mobile_app/constant/widget/backbutton.dart';
import 'package:social_mobile_app/constant/widget/primarybutton.dart';
import 'package:social_mobile_app/constant/widget/textwidget.dart';
import 'package:social_mobile_app/constant/widget/textboxwidget.dart';

import 'package:social_mobile_app/screen/auth/view/enterotpscreen.dart';

import '../../../constant/widget/background.dart';

class ForogtPasswordScreen extends StatefulWidget {
  const ForogtPasswordScreen({super.key});

  @override
  State<ForogtPasswordScreen> createState() => _ForogtPasswordScreenState();
}

class _ForogtPasswordScreenState extends State<ForogtPasswordScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          backgroundWidget(),
          Stack(

            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      const SizedBox(
                        height: 30,
                      ),
                       backIconButton(),
                     const  SizedBox(height: 15,),
                      kronaText("Forgot your password?", black, 18),
                      const SizedBox(
                        height: 05,
                      ),
                      robotoText("Let’s help you reset it and get you back in!",
                          black, 14),
                      SizedBox(
                        height:Get.height>415 ?Get.height * .05: Get.height * .02,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 106,
                        width: Get.width,
                        decoration: BoxDecoration(
                           border: Border.all(color: black),
                          boxShadow:const [
                          BoxShadow(
                              offset: Offset(4, 4),
                              blurRadius: 0,
                              spreadRadius: 0,
                              color: black)
                        ],
                            borderRadius: BorderRadius.circular(20), color: mint),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            textboxWidget(hinttext: "Email"),
                            const SizedBox(
                              height: 15,
                            ),
                         
                            ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.end,children: [
                primaryButton(text: "Send",onpress: (){
                  Get.to(()=>const EnterOTPScreen());
                }),
               const SizedBox(height: 15,),
                             
               const SizedBox(height: 15,),
              ],)
            ],
          ),
        ],
      ),
    );
  }
}
