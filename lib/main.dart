import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'controller/auth_controller.dart';

import 'constant/color.dart';
import 'screen/home/home_screen.dart';

Future<void> main() async {
  // Ensure all bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();
  Get.put(AuthController());

  // Start the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // ← THIS IS THE FINAL FIX
      debugShowCheckedModeBanner: false,
      title: 'Bun4Bun',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mint),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      // Add this line so GetX works everywhere
      navigatorKey: Get.key,
    );
  }
}
