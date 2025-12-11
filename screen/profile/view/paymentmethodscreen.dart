import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/widget/backbutton.dart';
import 'package:social_mobile_app/constant/widget/primarybutton.dart';
import 'package:social_mobile_app/constant/widget/text_widget.dart';
import 'package:social_mobile_app/screen/profile/controller/paymentcontroller.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  var paymentcontroller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: purple,leading: backIconButton(),title: kronaText("Payment Method", black, 18),),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: ListView(children: [
              Container(height: 02,width: Get.width,color: black,),
            const SizedBox(height: 15,),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  shrinkWrap: true,
                  itemCount: paymentcontroller.paymentlist.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: paymentWidget(
                        img: paymentcontroller.paymentlist[index]['img'],
                        index: index,
                        name: paymentcontroller.paymentlist[index]['title'],
                        ),
                  ),
                )
            
            ],),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: primaryButton(text: "Proceed to Pay",onpress: (){
              Get.back();
            }),
          )
        ],
      ),
    );
  }
  Widget paymentWidget({img, name, index}) {
    return GestureDetector(
      onTap: () {
        paymentcontroller.selectedindex.value = index;
       
      },
      child: Container(
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
          color: mint,
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              img,
              height: 24,
              width: 24,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              width: 10,
            ),
            robotoboldText(name, black, 14),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Obx(
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
                          color: paymentcontroller.selectedindex.value == index
                              ? black
                              : grey,
                          shape: BoxShape.circle),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}