import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_mobile_app/screen/bottomnavigation/view/bottomnavigationscreen.dart';
import 'package:social_mobile_app/screen/auth/view/loginscreen.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  // -----------------------------
  // REGISTER USER
  // -----------------------------
  Future<void> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = cred.user!.uid;

      // Save username in Firebase Auth profile
      await cred.user!.updateDisplayName(username);

      // Store user data in Firestore
      await _db.collection('users').doc(uid).set({
        'uid': uid,
        'username': username,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      Get.snackbar("Success", "Account created successfully!");
      Get.offAll(() => const BottomNavigationScreen());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // -----------------------------
  // LOGIN WITH USERNAME
  // -----------------------------
  Future<void> loginWithUsername({
    required String username,
    required String password,
  }) async {
    try {
      // Step 1 — Find email from Firestore
      String email = await _getEmailFromUsername(username);

      // Step 2 — Login with email/password
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Also update the Firebase Auth displayName so UI can show it
      await _auth.currentUser?.updateDisplayName(username);

      Get.snackbar("Success", "Logged in successfully!");
      Get.offAll(() => const BottomNavigationScreen());
    } catch (e) {
      Get.snackbar("Login Error", e.toString());
    }
  }

  // find email using username
  Future<String> _getEmailFromUsername(String username) async {
    final snap = await _db
        .collection('users')
        .where('username', isEqualTo: username)
        .limit(1)
        .get();

    if (snap.docs.isEmpty) {
      throw Exception("Username not found");
    }

    return snap.docs.first['email'];
  }

  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
    Get.offAll(() => const LoginScreen());
  }
}
