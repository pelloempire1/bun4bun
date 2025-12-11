import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/images.dart';
import 'package:social_mobile_app/constant/widget/backbutton.dart';
import 'package:social_mobile_app/constant/widget/textwidget.dart';
import 'package:social_mobile_app/screen/profile/controller/billingcontroller.dart';

class BillingRecordScreen extends StatefulWidget {
  const BillingRecordScreen({super.key});

  @override
  State<BillingRecordScreen> createState() => _BillingRecordScreenState();
}

class _BillingRecordScreenState extends State<BillingRecordScreen> {
  var billingcontroller = Get.put(BillingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backIconButton(),
        backgroundColor: purple,
        title: kronaText("Billing Record", black, 18),
      ),
      body: ListView(
         physics:const  BouncingScrollPhysics(),
        children: [
          Container(
            height: 2,
            width: Get.width,
            color: black,
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(
            ()=> billingcontroller.show.value == false ? 
            GestureDetector(
              onTap: (){
                billingcontroller.show.value =true;
              },
              child: Column(
                children: [
                  SizedBox(height: Get.height*.20,),
                  Image.asset(brb),
                ],
              ),
            ):
            ListView.builder(
              physics:const  NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: billingcontroller.billinglist.length,
              itemBuilder: (context, index) =>
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: billingWidget(date: billingcontroller.billinglist[index]),
                  ),
            ),
          )
          
        ],
      ),
    );
  }

  Widget billingWidget({date}){
    return           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              height: 125,
              width: Get.width,
              decoration: BoxDecoration(
                boxShadow:const [
                     BoxShadow(
                        offset: Offset(4, 4),
                        blurRadius: 0,
                        spreadRadius: 0,
                        color: black)
                ],
                  color: mint,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: black),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      robotoboldText("Date: $date", black, 14),
                      robotoboldText("Coin: 100", black, 14),
                      robotoboldText("Amount: \$1.22", black, 14),
                      robotoboldText("Payment Method: Credit Card", black, 14),
                    ],
                  ),
                    Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        download,
                        height: 50,
                        width: 50,
                      ),
                      robotoboldText("Receipt", black, 14,
                          textline: TextDecoration.underline)
                    ],
                  ),
                  

                  ],),
            ),
          );
  }
}
