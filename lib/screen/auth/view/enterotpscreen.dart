import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/widget/backbutton.dart';
import 'package:social_mobile_app/constant/widget/primarybutton.dart';
import 'package:social_mobile_app/constant/widget/textwidget.dart';
import 'package:social_mobile_app/screen/auth/view/resetpasswordscreen.dart';
import '../../../constant/widget/background.dart';

class EnterOTPScreen extends StatefulWidget {
  const EnterOTPScreen({super.key});

  @override
  State<EnterOTPScreen> createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends State<EnterOTPScreen> {
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
                      kronaText("Enter OTP Code", black, 18),
                      const SizedBox(
                        height: 05,
                      ),
                      robotoText(
                          "We've sent a code to your Email. Please enter it to \ncontinue.",
                          black,
                          14,
                          maxline: 2),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 106,
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Pinput(
                                      length: 4,
                                      followingPinTheme: PinTheme(
                                        height: 50,
                                        width: 50,
                                        textStyle: const TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 20,
                                            color: black),
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(2, 2),
                                                blurRadius: 0,
                                                spreadRadius: 0,
                                                color: black)
                                          ],
                                          border: Border.all(color: black),
                                          color: pink,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                      submittedPinTheme: PinTheme(
                                        height: 50,
                                        width: 50,
                                        textStyle: const TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 20,
                                            color: black),
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(2, 2),
                                                blurRadius: 0,
                                                spreadRadius: 0,
                                                color: black)
                                          ],
                                          border: Border.all(color: black),
                                          color: grey,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                      focusedPinTheme: PinTheme(
                                        height: 50,
                                        width: 50,
                                        textStyle: const TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 20,
                                            color: black),
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(2, 2),
                                                blurRadius: 0,
                                                spreadRadius: 0,
                                                color: black)
                                          ],
                                          border: Border.all(color: black),
                                          color: grey,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                      defaultPinTheme: PinTheme(
                                        height: 50,
                                        width: 50,
                                        textStyle: const TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 20,
                                            color: black),
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(2, 2),
                                                blurRadius: 0,
                                                spreadRadius: 0,
                                                color: black)
                                          ],
                                          color: pink,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  primaryButton(text: "Verify",onpress: (){
                        Get.to(()=>const ResetPasswordScreen());
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
                        text: "Don’t receive code? ",
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Get.to(() => const SignUpScreen());
                              },
                            text: "Resend",
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
