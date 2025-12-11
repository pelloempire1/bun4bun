import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/color.dart';
import '../../controller/auth_controller.dart';
import '../post/new_post_screen.dart';
import 'feed_screen.dart';
import 'discover_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  final _pages = const [
    FeedScreen(),
    DiscoverScreen(),
  ];

  void _onTap(int i) {
    setState(() => _index = i);
  }

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        title: const Text('Bun4Bun'),
        actions: [
          IconButton(
            onPressed: auth.logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: _pages[_index],
      floatingActionButton: FloatingActionButton(
        backgroundColor: dark,
        onPressed: () {
          Get.to(() => const NewPostScreen());
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => _onTap(0),
                icon: Icon(
                  Icons.home_filled,
                  color: _index == 0 ? dark : Colors.grey,
                ),
              ),
              const SizedBox(width: 40), // space for FAB
              IconButton(
                onPressed: () => _onTap(1),
                icon: Icon(
                  Icons.search,
                  color: _index == 1 ? dark : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
