import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/images.dart';
import 'package:social_mobile_app/constant/widget/backbutton.dart';
import 'package:social_mobile_app/screen/profile/view/paymentmethodscreen.dart';

import '../../../constant/widget/text_widget.dart';
import '../controller/walletcontroller.dart';
import 'billingrecordscreen.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
   var walletController = Get.put(WalletController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  
  body: ListView(padding:const EdgeInsets.all(0),children: [
    Container(height: 180,width: Get.width,decoration:  
   const  BoxDecoration(color: purple,border: Border(bottom: BorderSide(color: black,width: 2)),),
    
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const  SizedBox(height: 30,),
                    Row(
                      children: [
                        backIconButton(),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kronaText("Wallet", black, 18),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: (){
                            Get.to(()=>const BillingRecordScreen());
                          },
                          child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  color: mint,
                                  shape: BoxShape.circle,
                                  boxShadow:  [
                                    BoxShadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 0,
                                        spreadRadius: 0,
                                        color: black)
                                  ]),
                              child: Center(child: SvgPicture.asset(history))),
                        )
                      ],
                    ),
                  const SizedBox(
                    height: 05,
                  ),
                  robotoText("Balance", black, 16),
                  robotoboldText("\$1500", black, 35)
                  ],),
            ),),
          const SizedBox(height: 15,),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: 05,
            shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: GestureDetector(onTap: (){
                  Get.to(()=>const PaymentMethodScreen());
                },child: walletWidget(title: walletController.walletlist[index]['coin'],price: walletController.walletlist[index]['doller'])),
              ))
  ],),
    );
  }


  Widget walletWidget({title,price}){
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
                  Row(
                    children: [
                      Image.asset(coin1,height: 18,width: 18,),
                     const SizedBox(width: 05,),
                      robotoboldText(title, black, 14),
                    ],
                  ),
                  robotoboldText("\$$price", black, 14),
                ],
              ),
            );
  }
}