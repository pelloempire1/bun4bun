import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/images.dart';
import 'package:social_mobile_app/constant/widget/backbutton.dart';
import 'package:social_mobile_app/constant/widget/primarybutton.dart';
import 'package:social_mobile_app/constant/widget/textwidget.dart';
import 'package:social_mobile_app/screen/profile/view/blocklistscreen.dart';
import 'package:social_mobile_app/screen/profile/view/privacyscreen.dart';
import 'package:social_mobile_app/screen/profile/view/termsandconditionscreen.dart';
import 'package:social_mobile_app/screen/profile/view/walletscreen.dart';
import 'package:social_mobile_app/screen/splash/view/splashscreen.dart';

import '../controller/settingcontroller.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var settingcontroller = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     
      appBar: AppBar(backgroundColor: purple,leading: backIconButton(),title: kronaText("Setting", black, 18),),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(children: [
                const SizedBox(height: 15,),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: settingcontroller.settinglist.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: GestureDetector(onTap: (){
                        if(index == 1){
profilemenu();
                        }else if(index == 2){
postmenu();
                        }else if(index == 0){
                          Get.to(()=>const WalletScreen());
                        }else if(index ==3){
                        Get.to(()=>const BlockScreen());

                        }else if(index == 4){
                            Get.to(()=>const TermsAndConditionScreen());

                        }else {
                             Get.to(()=>const PrivacyScreen());
                        }
                      },child: settingWidget(title: settingcontroller.settinglist[index])),
                    ),
              )
                  
              ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
            SizedBox(width: Get.width*.40,
            child: primaryButton(text: "Log out",onpress: (){
              logout();
            }),),
                 SizedBox(width: Get.width*.40,
            child: primaryButton(text: "Delete Account",onpress: (){
              deleteaccount();
            }),)
            ],),
          )
        ],
      ),
    );
  }
  profilemenu() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        child: Container(
          
          height:260,
          width: Get.width,
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20.0),
          decoration: BoxDecoration(
            border: Border.all(color: black),
            boxShadow:const [BoxShadow(
                    offset: Offset(5, 5),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: black)],
            borderRadius: BorderRadius.circular(40),
            color: grey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
         
            notisettingWidget(name: "Message",buttonvalue: settingcontroller.no1),
           const  SizedBox(height: 10,),
              notisettingWidget(name: "Post & Comments",buttonvalue: settingcontroller.no2),
                 const  SizedBox(height: 10,),
              notisettingWidget(name: "Follow Request",buttonvalue: settingcontroller.no3),
                 const  SizedBox(height: 10,),
              notisettingWidget(name: "Rewards",buttonvalue: settingcontroller.no4),
            ],
          ),
        ),
      ),
    );
  }


  Widget notisettingWidget({name,  buttonvalue}) {
    return Container(
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
                child: Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    
                    onChanged: (value) {
                      buttonvalue.value = value;
                      //this toggle between light and dark mode
                    },
                    value: buttonvalue.value,
                    activeColor: grey,
inactiveTrackColor: grey,
                    activeTrackColor: black,
                    inactiveThumbColor: black
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
      postmenu() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        child: Container(
          
          height:200,
          width: Get.width,
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20.0),
          decoration: BoxDecoration(
            border: Border.all(color: black),
            boxShadow:const [BoxShadow(
                    offset: Offset(5, 5),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: black)],
            borderRadius: BorderRadius.circular(40),
            color: grey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            selectedpostwidget(index: 0,name: "Nobody"),
            selectedpostwidget(index: 1,name: "My Followers"),
              selectedpostwidget(index: 2,name: "All"),
            ],
          ),
        ),
      ),
    );
  }


    Widget selectedpostwidget({ name, index}) {
    return GestureDetector(
      onTap: () {
        settingcontroller.selectedpost.value = index;
       
      },
      child: Container(
        padding:const  EdgeInsets.symmetric(horizontal: 16.0),
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          boxShadow: const [       BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 0,
                        spreadRadius: 0,
                        color: black)],
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
                decoration:  BoxDecoration(
                  border: Border.all(color: black),
                    shape: BoxShape.circle,
                    color: grey),
                child: Center(
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: settingcontroller.selectedpost.value == index
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
    logout() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        child: Container(
          height:200,
          width: Get.width,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: black,),
            boxShadow:const [BoxShadow(
                    offset: Offset(5, 5),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: black)],
            borderRadius: BorderRadius.circular(40),
            color: grey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              kronaText("Log out", black,18),
              robotoboldText(
                  "Logout will not delete any data. You can still log in with this account.",
                  black,
                  maxline: 2,
               14,
                  align: TextAlign.center),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                  GestureDetector(
                     onTap: (){
                      Get.back();
                    },
                    child: Container(
                      height: 50,width: Get.width*.35,
                      decoration: BoxDecoration(   border: Border.all(color: black,),
            boxShadow:const [BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: black)],borderRadius: BorderRadius.circular(50),color: mint),
                        child: Center(child: robotoboldText("Cancel", black, 16))),
                  ),
                    GestureDetector(
                      onTap: (){
                        Get.offAll(()=>const SplashScreen());
                      },
                      child: Container(
                      height: 50,width: Get.width*.35,
                      decoration: BoxDecoration(   border: Border.all(color: black,),
                                  boxShadow:const [BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 0,
                      spreadRadius: 0,
                      color: black)],borderRadius: BorderRadius.circular(50),color: pink),
                        child: Center(child: robotoboldText("Log Out", black, 16))),
                    ),
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


      deleteaccount() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        child: Container(
          height:200,
          width: Get.width,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: black,),
            boxShadow:const [BoxShadow(
                    offset: Offset(5, 5),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: black)],
            borderRadius: BorderRadius.circular(40),
            color: grey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              kronaText("Delete Account", black,18),
              robotoboldText(
                  "Are you sure you want to delete your \naccount?",
                  black,
                  maxline: 2,
               14,
                  align: TextAlign.center),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                  GestureDetector(
                     onTap: (){
                      Get.back();
                    },
                    child: Container(
                      height: 50,width: Get.width*.35,
                      decoration: BoxDecoration(   border: Border.all(color: black,),
            boxShadow:const [BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: black)],borderRadius: BorderRadius.circular(50),color: mint),
                        child: Center(child: robotoboldText("Cancel", black, 16))),
                  ),
                    Container(
                    height: 50,width: Get.width*.35,
                    decoration: BoxDecoration(   border: Border.all(color: black,),
            boxShadow:const [BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: black)],borderRadius: BorderRadius.circular(50),color: pink),
                      child: Center(child: robotoboldText("Delete", black, 16))),
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget settingWidget({title}){
    return Container(
              padding:const EdgeInsets.symmetric(horizontal: 16.0),
              height: 50,
              width: Get.width,
              decoration: BoxDecoration(
                boxShadow:const  [
               BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: black),
                ],
                  border: Border.all(color: black),
                  borderRadius: BorderRadius.circular(50),
                  color: mint),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  robotoboldText(title, black, 14),
                  Image.asset(
                    play1,
                    height: 20,
                    width: 20,
                  )
                ],
              ),
            );
  }
}