import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/images.dart';
import 'package:social_mobile_app/constant/widget/primarybutton.dart';
import 'package:social_mobile_app/constant/widget/textwidget.dart';
import 'package:social_mobile_app/constant/widget/textboxwidget.dart';
import 'package:social_mobile_app/constant/widget/textboxwidget2.dart';
import 'package:social_mobile_app/screen/auth/view/loginscreen.dart';
import 'package:social_mobile_app/controller/auth_controller.dart';

import '../../../constant/widget/backbutton.dart';
import '../../../constant/widget/background.dart';
import '../controller/signupcontroller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var signupcontroller = Get.put(SignupController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
                    
                      kronaText("Sign Up and Start Sparking!", black, 18),
                      const SizedBox(
                        height: 05,
                      ),
                      robotoText("A world of friends and fun awaits – let’s get \nstarted.",
                          black, 14,maxline: 2),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 386,
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
                            textboxWidget(
                                hinttext: "User Name",
                                controller: usernameController),
                              const SizedBox(
                              height: 15,
                            ),
                            textboxWidget(
                                hinttext: "Email", controller: emailController),
                            const SizedBox(
                              height: 15,
                            ),
                            Obx(() => textboxWidget2(
                                hinttext: "Password",
                                issuffix: true,
                                controller: passwordController,
                                isvisible: signupcontroller.isinvisiblepassword)),
                                   const SizedBox(
                              height: 15,
                            ),
                            Obx(() => textboxWidget2(
                                hinttext: "Confirm Password",
                                issuffix: true,
                                controller: confirmPasswordController,
                                isvisible: signupcontroller.isinvisiblepassword2)),                
                                  const SizedBox(
                              height: 15,
                            ),
                         
                            const SizedBox(
                              height: 20,
                              
                            ),
                            robotoText("Or", black, 14),
                            const SizedBox(
                              height: 20,
                              
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                              Image.asset(google,height: 30,width: 30,),
                             const SizedBox(width: 30,),
                               Image.asset(apple,height: 30,width: 30,)
                            ],)
                            ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.end,children: [
                primaryButton(text: "Sign up",onpress: (){
                  AuthController.to.registerUser(
                    username: usernameController.text.trim(),
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                }),
               const SizedBox(height: 15,),
                              Center(
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: const TextStyle(
                        fontFamily: "Roboto",
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                    text: "Already have an account? ",
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => const LoginScreen());
                          },
                        text: "Log in",
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          color: black,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
               const SizedBox(height: 15,),
              ],)
            ],
          ),
        ],
      ),
    );
  }
}
