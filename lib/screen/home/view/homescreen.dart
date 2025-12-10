import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/images.dart';
import 'package:social_mobile_app/constant/widget/textwidget.dart';
import 'package:social_mobile_app/screen/home/controller/homecontroller.dart';
import 'package:social_mobile_app/screen/home/view/trendingscreen.dart';
import 'package:social_mobile_app/screen/profile/view/walletscreen.dart';
import '../../messge/view/otherprofileblank.dart';
import '../../notification/view/searchscreen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  var homecontroller = Get.put(HomeController());
  final CardSwiperController controller = CardSwiperController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mint,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mint,
        surfaceTintColor: mint,
        title: kronaText(
          "Hello ${FirebaseAuth.instance.currentUser?.displayName ?? ''}",
          black,
          18,
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Get.to(()=>const SearchScreen());
            },
            child: Image.asset(
              search,
              height: 40,
              width: 40,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: (){
                Get.to(()=>const WalletScreen());
            },
            child: Image.asset(
              coin,
              height: 40,
              width: 40,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 15,
          ),
          topWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                kronaText("Trending Now", black, 18),
                GestureDetector(onTap: (){
                  Get.to(()=>const TrendingScreen());
                },child: kronaText("View all>>", black, 12)),
              ],
            ),
          ),
          trendingWidget(),
          const SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }

  Widget trendingWidget() {
    return SizedBox(
      height: 400,
      width: Get.width,
      child: CardSwiper(
        backCardOffset: const Offset(0, 20),
        // scale: 1,
        maxAngle: 50,
        controller: controller,
        cardsCount: 3,
        allowedSwipeDirection:
            const AllowedSwipeDirection.only(right: true, left: true),
        // onSwipe: _onSwipe,
        // onUndo: _onUndo,
        numberOfCardsDisplayed: 3,
        // backCardOffset: const Offset(40, 40),
        // padding: const EdgeInsets.all(24.0),
        cardBuilder: (
          context,
          index,
          horizontalThresholdPercentage,
          verticalThresholdPercentage,
        ) =>
            GestureDetector(
          onTap: () {
                   Get.to(()=>const OtherProfileBlackScreen());

          },
          child: Center(
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(index == 1
                  ? 15 / 360
                  : index == 2
                      ? -15 / 360
                      : 0 / 360),
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(5, 5),
                              color: black,
                              spreadRadius: 0,
                              blurRadius: 0)
                        ],
                        color: index == 0
                            ? purple
                            : index == 1
                                ? pink
                                : purple,
                        border: Border.all(color: black, width: 1),
                        borderRadius: BorderRadius.circular(20)),
                    height: 410,
                    width: 270,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                border: Border.all(color: black),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(4, 4),
                                      blurRadius: 0,
                                      spreadRadius: 0,
                                      color: black),
                                ],
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(150),
                                    topRight: Radius.circular(150),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    ),
                                    ),
                            height:244,
                            width: 230,
                            child: ClipRRect(
                              clipBehavior: Clip.hardEdge,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(150),
                                  topRight: Radius.circular(150),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              child: Image.asset(
                                h1,
                                height: 160,
                                width: 170,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              kronaText("Stilena Dorshy, 23", black, 18),
                              const SizedBox(
                                height: 03,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(location),
                                  const SizedBox(
                                    width: 05,
                                  ),
                                  robotoText("Berlin", black, 14),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: .0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      child: robotoText(
                                          "Live, laugh, and vibe with me!",
                                          black,
                                          14),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // bottomcontroller.bottomindex.value = 2;
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 75,
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(2, 2),
                                                blurRadius: 0,
                                                spreadRadius: 0,
                                                color: black),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: mint,
                                          border: Border.all(color: black),
                                        ),
                                        child: Center(
                                          child: robotoboldText(
                                              "Follow", black, 14),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 15,
                    top: 15,
                    child: Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(boxShadow: const [
                        BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 0,
                            spreadRadius: 0,
                            color: black),
                      ], borderRadius: BorderRadius.circular(20), color: grey),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            coin1,
                            height: 12,
                            width: 12,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          robotoText("VIP", black, 12)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget topWidget() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: homecontroller.homelist.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 15.0, bottom: 10),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
            onTap: (){
                  Get.to(()=>const OtherProfileBlackScreen());
                  
                  },
                child: Container(
                  height: 175,
                  width: 130,
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        black.withValues(alpha:0.2),
                        black.withValues(alpha:0.40),
                      ],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      stops: const [0, 0.5],
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: black),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(5, 5),
                            blurRadius: 0,
                            spreadRadius: 0,
                            color: black),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Image.asset(
                    homecontroller.homelist[index]['img']!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: -10,
                child: Container(
                  height: 20,
                  width: 50,
                  decoration: BoxDecoration(boxShadow: const [
                    BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 0,
                        spreadRadius: 0,
                        color: black)
                  ], borderRadius: BorderRadius.circular(20), color: grey),
                  child: Center(child: robotoboldText("New", black, 12)),
                ),
              ),
              Positioned(
                  bottom: 30,
                  left: 10,
                  child: kronaText(
                      homecontroller.homelist[index]['name']!, grey, 10))
            ],
          ),
        ),
      ),
    );
  }
}
