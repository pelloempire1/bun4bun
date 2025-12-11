// lib/screen/home/home_screen.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const FeedTab(), // 0 - Home
    const SearchTab(), // 1 - Search
    const ActivityTab(), // 2 - Activity
    const ProfileTab(), // 3 - Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
              backgroundColor: Colors.black,
              child: const Icon(Icons.add, color: Colors.white, size: 32),
              onPressed: () => Get.to(() => const NewPostScreen()),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Activity",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

// FEED TAB — EXACT TEA LOOK
class FeedTab extends StatelessWidget {
  const FeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Bun4Bun",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          final docs = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
            itemCount: docs.length,
            itemBuilder: (context, i) {
              final data = docs[i].data() as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: data['photoUrl'] != null
                          ? NetworkImage(data['photoUrl'])
                          : null,
                      child: data['photoUrl'] == null
                          ? Text((data['username'] ?? 'A')[0].toUpperCase())
                          : null,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['username'] ?? 'User',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            data['text'] ?? '',
                            style: const TextStyle(fontSize: 17, height: 1.4),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              _icon(
                                Icons.mode_comment_outlined,
                                data['replies'] ?? 0,
                              ),
                              const SizedBox(width: 32),
                              _icon(Icons.repeat, data['reposts'] ?? 0),
                              const SizedBox(width: 32),
                              _icon(Icons.favorite_border, data['likes'] ?? 0),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _icon(IconData icon, int count) => Row(
    children: [
      Icon(icon, size: 22, color: Colors.grey[700]),
      const SizedBox(width: 6),
      Text("$count", style: TextStyle(color: Colors.grey[700])),
    ],
  );
}

// Placeholder tabs — we’ll build these next
class SearchTab extends StatelessWidget {
  const SearchTab({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text("Search coming soon"));
}

class ActivityTab extends StatelessWidget {
  const ActivityTab({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text("Activity coming soon"));
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text("Profile coming soon"));
}

// NewPostScreen stays the same
class NewPostScreen extends StatelessWidget {
  const NewPostScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Get.back(),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              if (controller.text.trim().isEmpty) return;
              await FirebaseFirestore.instance.collection('posts').add({
                'uid': user.uid,
                'username': user.displayName ?? 'User',
                'photoUrl': user.photoURL ?? '',
                'text': controller.text.trim(),
                'timestamp': FieldValue.serverTimestamp(),
                'likes': 0,
                'replies': 0,
                'reposts': 0,
              });
              Get.back();
            },
            child: const Text(
              "Post",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          controller: controller,
          autofocus: true,
          maxLines: null,
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            hintText: "What's the tea?",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
