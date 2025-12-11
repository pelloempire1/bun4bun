import 'package:get/get.dart';
import 'package:social_mobile_app/constant/images.dart';

class MessageController extends GetxController {
  var selectedmenu = 0.obs;
  var messagevisible = false.obs;
  var selectedaction = 0.obs;
var show =  false.obs;
  var stickerlist = [
    {"img": e1, "price": "212"},
    {"img": e2, "price": "12"},
    {"img": e3, "price": "20"},
    {"img": e4, "price": "25"},
    {"img": e5, "price": "212"},
    {"img": e6, "price": "12"},
    {"img": e7, "price": "20"},
    {"img": e8, "price": "25"},
    {"img": e9, "price": "212"},
    {"img": e10, "price": "20"},
    {"img": e11, "price": "12"},
    {"img": e12, "price": "25"},
    {"img": e13, "price": "212"},
    {"img": e14, "price": "20"},
    {"img": e15, "price": "12"},
    {"img": e16, "price": "25"}
  ];
    var giflist = [
    {"img": g1, "price": "212"},
    {"img": g2, "price": "12"},
    {"img": g3, "price": "20"},
    {"img": g4, "price": "25"},
    {"img": g5, "price": "212"},
    {"img": g6, "price": "12"},
    {"img": g7, "price": "20"},
    {"img": g8, "price": "25"},
    {"img": g9, "price": "212"},
    {"img": g10, "price": "20"},
    {"img": g11, "price": "12"},
    {"img": g12, "price": "25"},
    {"img": g13, "price": "212"},
    {"img": g14, "price": "20"},
    {"img": g15, "price": "12"},
    {"img": g16, "price": "25"}
  ];
  var messagelist = [
    {
      "img": m1,
      "title": "Olivia Brooks, 22",
      "sub": "Here to connect and create memories!",
      "time": "04:30 PM"
    },
    {
      "img": m2,
      "title": "Lily Fernandez",
      "sub": "Here to connect and create memories!",
      "time": "Mon"
    },
    {
      "img": m3,
      "title": "Sophia Chen",
      "sub": "Here to connect and create memories!",
      "time": "Tue"
    },
    {
      "img": m4,
      "title": "Grace Hamilton",
      "sub": "Here to connect and create memories!",
      "time": "Tue"
    }
  ];
}
