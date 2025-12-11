import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/screen/auth/view/loginscreen.dart';

import '../../../constant/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 02),
    () =>
    Get.offAll(()=>const LoginScreen())
    ,);
    super.initState();

log("Height:::::${Get.height}");
log("Width:::::${Get.width}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        splash,
        width: Get.width,
        height: Get.height,
        fit: BoxFit.fill,
      ),
    );
  }
}
