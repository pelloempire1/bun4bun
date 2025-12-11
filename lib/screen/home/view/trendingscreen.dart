import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/screen/home/controller/trendingcontroller.dart';
import '../../../constant/color.dart';
import '../../../constant/images.dart';
import '../../../constant/widget/backbutton.dart';
import '../../../constant/widget/textwidget.dart';
import '../../messge/view/otherprofileblank.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  var trendingcontroller = Get.put(TrendingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        surfaceTintColor: purple,
        backgroundColor: purple,
        leading: backIconButton(),
        title: kronaText("Trending Now", black, 18),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              height: 1,
              width: Get.width,
              color: black,
            ),
            const SizedBox(
              height: 15,
            ),
            GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: Get.width * .02),
                itemCount: trendingcontroller.trendlist.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 300,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) => trendingWidget(
                    image: trendingcontroller.trendlist[index]['img'],
                    name: trendingcontroller.trendlist[index]['name'])),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget trendingWidget({image, name}) {
    return Stack(
      children: [
        GestureDetector(
          onTap: (){
                Get.to(()=>const OtherProfileBlackScreen());
          },
          child: Container(
            height: 300,
            width: Get.width * .45,
            decoration: BoxDecoration(
              border: Border.all(color: black),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(5, 5),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: black),
              ],
              color: purple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
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
                            bottomRight: Radius.circular(30))),
                    height: 180,
                    width: Get.width<415 ?145:165,
                    child: ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(150),
                          topRight: Radius.circular(150),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: Image.asset(
                        image,
                        height: 180,
                        width: 165,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * .01),
                  child: Column(
                    children: [
                      kronaText(name, black, 14),
                      const SizedBox(
                        height: 05,
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
                      const SizedBox(
                        height: 05,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width * .22,
                            child: robotoboldText(
                                "Live, laugh, and vibe with me!", black, 14,
                                textoverflow: TextOverflow.ellipsis),
                          ),
                          GestureDetector(
                            onTap: () {
                              // bottomcontroller.bottomindex.value = 2;
                            },
                            child: Container(
                                height: 30,
                                width: Get.width<415 ?60: 75,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 0,
                                        spreadRadius: 0,
                                        color: black),
                                  ],
                                  borderRadius: BorderRadius.circular(50),
                                  color: mint,
                                  border: Border.all(color: black),
                                ),
                                child: Center(
                                    child: robotoboldText("Follow", black, 14),),),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
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
    );
  }
}
