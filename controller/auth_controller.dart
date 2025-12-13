import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../screen/home/home_screen.dart';
import '../screen/auth/login_screen.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  /// Register with email + password + username
  Future<void> register({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final cred = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      await cred.user?.updateDisplayName(username.trim());

      Get.offAll(() => const HomeScreen());
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message ?? 'Registration failed';
    } catch (_) {
      errorMessage.value = 'Something went wrong';
    } finally {
      isLoading.value = false;
    }
  }

  /// Login with email + password
  Future<void> login({required String email, required String password}) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      Get.offAll(() => const HomeScreen());
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message ?? 'Login failed';
    } catch (_) {
      errorMessage.value = 'Something went wrong';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    Get.offAll(() => const LoginScreen());
  }
}
