import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/widget/primarybutton.dart';
import 'package:social_mobile_app/screen/auth/view/adprofilescreen.dart';
import 'package:social_mobile_app/screen/discover/view/addpostscren.dart';
import 'package:social_mobile_app/screen/messge/controller/profilecontroller.dart';
import 'package:social_mobile_app/screen/messge/view/postdetailscreen.dart';
import 'package:social_mobile_app/screen/profile/view/settingscreen.dart';
import '../../../constant/images.dart';
import '../../../constant/widget/textwidget.dart';

class ProfileBlackScreen extends StatefulWidget {
  const ProfileBlackScreen({super.key});

  @override
  State<ProfileBlackScreen> createState() => _ProfileBlackScreenState();
}

class _ProfileBlackScreenState extends State<ProfileBlackScreen> {
  var profilecontroller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final name = user?.displayName ?? '';

    return Scaffold(
      backgroundColor: mint,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(0),
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 150,
                width: Get.width,
                decoration: const BoxDecoration(
                    color: purple,
                    border:
                        Border(bottom: BorderSide(color: black, width: 2.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kronaText("My Profile", black, 18),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          Get.to(()=>const AddPostScreen());
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: mint,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(add),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: Get.width * .50 - 50,
                right: Get.width * .50 - 50,
                bottom: -50,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(4, 4),
                          blurRadius: 0,
                          spreadRadius: 0,
                          color: black)
                    ],
                    border: Border.all(
                      color: black,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(mp),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kronaText(name, black, 14),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(check)
                ],
              ),
              const SizedBox(
                height: 05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  robotoText(
                    "@$name",
                    black.withValues(alpha: 0.50),
                    14,
                  ),
                ],
              ),
              const SizedBox(
                height: 05,
              ),
              robotoText("Here to connect and create memories!",
                  black.withValues(alpha:0.50), 14)
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              boxWidget(title: "Visitors", value: "35"),
              boxWidget(title: "Follower", value: "253"),
              boxWidget(title: "Following", value: "1k"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: Get.width * .40,
                child: primaryButton(text: "Edit Profile",onpress: (){
                  Get.to(()=> AddProfileScreen(title: "Edit Profile",));
                }),
              ),
              SizedBox(
                width: Get.width * .40,
                child: primaryButton(text: "Setting",onpress: (){
                  Get.to(()=>const SettingScreen());
                }),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            height: 1,
            color: black,
          ),

Obx(
  ()=> profilecontroller.show.value  == false  ?
  GestureDetector(
    onTap: (){
      profilecontroller.show.value = true;
    },
    child: Column(children: [ SizedBox(height: Get.height*.15,),
    Image.asset(npp,height: 150,width: Get.width*.70,),
    SizedBox(height: Get.height*.15,),],),
  ) :
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: profilecontroller.profilelist2.length,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisExtent: 120,
                    mainAxisSpacing: 15.0),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                     Get.to(()=>const PostDetailScreen());
                  },
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    height: 120,
                    width: Get.width * .28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: black),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(4, 4),
                            blurRadius: 0,
                            spreadRadius: 0,
                            color: black),
                      ],
                    ),
                    child: Image.asset(
                      profilecontroller.profilelist2[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
),
          const SizedBox(
            height: 30,
          ),

        ],
      ),
    );
  }

  Widget boxWidget({title, value}) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        color: grey,
        boxShadow: const [
          BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 0,
              spreadRadius: 0,
              color: black),
        ],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: black),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          kronaText(value, black, 14),
          robotoText(title, black.withValues(alpha:0.50), 12)
        ],
      ),
    );
  }
}
