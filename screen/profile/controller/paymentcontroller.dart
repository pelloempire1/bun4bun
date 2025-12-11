

import 'package:get/get.dart';
import 'package:social_mobile_app/constant/images.dart';

class PaymentController extends GetxController{
  var selectedindex = 0.obs;

  var paymentlist = [
    {"img": pa1, "title": "UPI Option"},
    {"img": pa2, "title": "Credit/Debit Card"},
    {"img": pa3, "title": "Netbanking"}
  ];
}