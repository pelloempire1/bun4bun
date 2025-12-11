import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:social_mobile_app/screen/home/home_screen.dart'; // ← THIS IS THE ONLY ONE WE NEED NOW
// ALL OLD BOTTOM NAV IMPORTS ARE GONE FOREVER

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    // Listen to auth state changes
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        // USER IS LOGGED IN → GO TO CLEAN HOME WITH BOTTOM NAV
        Get.offAll(() => const HomeScreen());
      } else {
        // NO USER → GO TO LOGIN (or splash will handle it)
        // You can leave this empty or route to login if needed
      }
    });
  }

  // LOGIN FUNCTION (email & password)
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Success → GetX listener above will auto-send to HomeScreen
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  // REGISTER FUNCTION
  Future<void> register(String email, String password, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await result.user?.updateDisplayName(username);
      // Success → auto go to HomeScreen via listener
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
    Get.offAllNamed('/login'); // or splash, whatever you want
  }
}
