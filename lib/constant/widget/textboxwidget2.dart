
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';



// import '../../screen/auth/controller/themecontroller.dart';
// import '../colors.dart';
//     final ThemeController themeController = Get.find();

Widget textboxWidget2(
    {title,
    hinttext,
    issuffix = false,
    maxline = 1,
    controller,
    borderradius = 50.0,
    isenabled = true,
    RxBool? isvisible}) {
  return Container(
      decoration:  BoxDecoration(
      borderRadius: BorderRadius.circular(50),
       boxShadow:const [
                    BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 0,
                        spreadRadius: 0,
                        color: black)
                  ],
    ),
    child: TextFormField(
      enabled: isenabled,
      controller: controller,
      maxLines: maxline,
      obscureText: isvisible!.value,
      style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: black,
          fontFamily: "Roboto"),
      decoration: InputDecoration(
        fillColor:grey,
        filled: true,
        border: OutlineInputBorder(
            borderSide:  const BorderSide(color:  black,),
            borderRadius: BorderRadius.circular(borderradius)),
        enabledBorder: OutlineInputBorder(
            borderSide:   const BorderSide(color:  black,),
            borderRadius: BorderRadius.circular(borderradius)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: black),
            borderRadius: BorderRadius.circular(borderradius)),
        hintText: hinttext,
        hintStyle:  const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: black,
          fontFamily: "Roboto",
        ),
        suffixIcon: issuffix
            ? IconButton(
                onPressed: () {
                  if (isvisible.value == true) {
                    isvisible.value = false;
                  } else {
                    isvisible.value = true;
                  }
                },
                icon: Obx(() => Icon(
                    !isvisible.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: black)))
            : const SizedBox(
                width: 2,
                height: 2,
              ),
      ),
    ),
  );
}
