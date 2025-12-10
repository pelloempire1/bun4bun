import 'package:get/get.dart';
import 'package:social_mobile_app/screen/discover/view/discoverscreen.dart';
import 'package:social_mobile_app/screen/home/view/homescreen.dart';
import 'package:social_mobile_app/screen/notification/view/notificationscreen.dart';
import 'package:social_mobile_app/screen/profile/view/profilescreen.dart';
import '../../messge/view/messagescreen.dart';

class BottomController extends GetxController{
  var selectedindex = 0.obs;
  var bottomlist =const  [
    HomePageScreen(),
    DiscoverScreen(),
    MessageScreen(),
    NotificationScreen(),
    ProfileBlackScreen()
  ];
}