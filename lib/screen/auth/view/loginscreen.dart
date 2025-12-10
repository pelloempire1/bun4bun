import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/screen/auth/controller/logincontroller.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/images.dart';
import 'package:social_mobile_app/constant/widget/primarybutton.dart';
import 'package:social_mobile_app/constant/widget/textwidget.dart';
import 'package:social_mobile_app/constant/widget/textboxwidget.dart';
import 'package:social_mobile_app/constant/widget/textboxwidget2.dart';
import 'package:social_mobile_app/screen/auth/view/forgotpasswordscreen.dart';
import 'package:social_mobile_app/controller/auth_controller.dart';

import '../../../constant/widget/background.dart';
import 'signupscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var logincontroller = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
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
                        height: 60,
                      ),
                      kronaText("Log In to SocialSpark", black, 18),
                      const SizedBox(
                        height: 05,
                      ),
                      robotoText(
                          "Join the vibe and connect with a world of friends!",
                          black,
                          14),
                      SizedBox(
                        height: Get.height * .05,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 285,
                        width: Get.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: black),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(4, 4),
                                  blurRadius: 0,
                                  spreadRadius: 0,
                                  color: black)
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: mint),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            textboxWidget(
                              hinttext: "User Name",
                              controller: usernameController,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Obx(() => textboxWidget2(
                                hinttext: "Password",
                                issuffix: true,
                                controller: passwordController,
                                isvisible:
                                    logincontroller.isinvisiblepassword)),
                            const SizedBox(
                              height: 15,
                            ),
                            Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                    onTap: () {
                                      Get.to(
                                          () => const ForogtPasswordScreen());
                                    },
                                    child: robotoboldText(
                                        "Forgot Password?", black, 14,
                                        textline: TextDecoration.underline))),
                            const SizedBox(
                              height: 25,
                            ),
                            robotoText("Or", black, 14),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  google,
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Image.asset(
                                  apple,
                                  height: 30,
                                  width: 30,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  primaryButton(
                      text: "Log in",
                      onpress: () {
                        AuthController.to.loginWithUsername(
                          username: usernameController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: const TextStyle(
                            fontFamily: "Roboto",
                            color: black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        text: "Don’t have an account? ",
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => const SignupScreen());
                              },
                            text: "Sign Up",
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
                  const SizedBox(
                    height: 15,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
