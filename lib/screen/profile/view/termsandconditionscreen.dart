
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/widget/textwidget.dart';

import '../../../constant/widget/backbutton.dart';


class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({super.key});

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {

      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        backgroundColor: purple,
     
        leading:  backIconButton(),
        title: kronaText("Terms & Condition", black, 18),
       
      ),
      body: ListView(
        children: [
          Container(height: 02,width: Get.width,color: black,),
          const SizedBox(
            height: 12,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              robotoboldText("Information We Collect From You", black, 16),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: robotoText(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ullamcorper tortor vel semper maximus. Nam volutpat, magna vitae pharetra dictum, dolor magna tempor velit, nec varius libero lectus id odio. Nulla facilisi.",
                      black.withValues(alpha:0.50),
                      12,
                      maxline: 4),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: robotoText(
                      "\u2022 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis semper odio, vel hendrerit est. Quisque vestibulum, mi id commodo pulvinar, nisi libero bibendum quam, ut faucibus tortor est id dui. ",
                        black.withValues(alpha:0.50),
                      12,
                      maxline: 4),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: robotoText(
                      "\u2022 Cras porttitor placerat ipsum, vel tincidunt odio volutpat non. Proin nec ipsum non ante lobortis rhoncus eu non urna.",
                                              black.withValues(alpha:0.50),
                    
                      12,
                      maxline: 4),
                ),
                const SizedBox(
                  height: 12,
                ),
                robotoboldText("Services & Offers", black, 16),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: robotoText(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ullamcorper tortor vel semper maximus. Nam volutpat, magna vitae pharetra dictum, dolor magna tempor velit, nec varius libero lectus id odio. Nulla facilisi.",
                             black.withValues(alpha:0.50),
                      12,
                      maxline: 4),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: robotoText(
                      "\u2022 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis semper odio, vel hendrerit est. Quisque vestibulum, mi id commodo pulvinar, nisi libero bibendum quam, ut faucibus tortor est id dui. ",
                                              black.withValues(alpha:0.50),
                    
                      12,
                      maxline: 4),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: robotoText(
                      "\u2022 Cras porttitor placerat ipsum, vel tincidunt odio volutpat non. Proin nec ipsum non ante lobortis rhoncus eu non urna.",
                                             black.withValues(alpha:0.50),
                    
                      12,
                      maxline: 4),
                ),
                const SizedBox(
                  height: 12,
                ),
                robotoboldText("Service Free ", black, 16),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: robotoText(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ullamcorper tortor vel semper maximus. Nam volutpat, magna vitae pharetra dictum, dolor magna tempor velit, nec varius libero lectus id odio. Nulla facilisi.",
                                               black.withValues(alpha:0.50),
                    
                      12,
                      maxline: 4),
                ),
                const SizedBox(
                  height: 50,
                ),
            ],
          ),
        ),
        ],
      ),
    );
  }
}
