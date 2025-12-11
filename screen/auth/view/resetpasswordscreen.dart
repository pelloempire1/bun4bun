
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/screen/auth/controller/logincontroller.dart';
import 'package:social_mobile_app/constant/color.dart';

import 'package:social_mobile_app/constant/widget/primarybutton.dart';
import 'package:social_mobile_app/constant/widget/text_widget.dart';

import 'package:social_mobile_app/constant/widget/textboxwidget2.dart';
import 'package:social_mobile_app/screen/auth/login_screen.dart';

import '../../../constant/widget/backbutton.dart';
import '../../../constant/widget/background.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var logincontroller = Get.put(LoginController());
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
                      const SizedBox(
                        height: 15,
                      ),
                      kronaText("Reset Your Password", black, 18),
                      const SizedBox(
                        height: 05,
                      ),
                      robotoText("Create a new password to regain access to your \naccount.",
                          black, 14,maxline: 2),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 200,
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
                            Obx(() => textboxWidget2(
                                hinttext: "Password",
                                issuffix: true,
                                isvisible: logincontroller.isinvisiblepassword)),
                
                            const SizedBox(
                              height: 15,
                            ),
                            Obx(() => textboxWidget2(
                                hinttext: "Confirm Password",
                                issuffix: true,
                                isvisible: logincontroller.isinvisiblepassword)),
                
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
                primaryButton(text: "Continue",onpress: (){
                                     Get.offAll(()=>const LoginScreen());
                }),
              
               const SizedBox(height: 15,),
              ],)
            ],
          ),
        ],
      ),
    );
  }
}
