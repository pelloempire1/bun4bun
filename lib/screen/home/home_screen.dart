import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator(color: Colors.black));
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: data['photoUrl'] != null && data['photoUrl'].toString().isNotEmpty
                          ? NetworkImage(data['photoUrl'])
                          : null,
                      child: data['photoUrl'] == null || data['photoUrl'].toString().isEmpty
                          ? Text(
                              (data['username'] ?? 'A').substring(0, 1).toUpperCase(),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          : null,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Username
                          Text(
                            data['username'] ?? 'Anonymous',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          // Post text
                          Text(
                            data['text'] ?? '',
                            style: const TextStyle(fontSize: 17, height: 1.4),
                          ),
                          const SizedBox(height: 12),
                          // Action icons — EXACT Tea style
                          Row(
                            children: [
                              _iconWithCount(Icons.mode_comment_outlined, data['replies'] ?? 0),
                              const SizedBox(width: 32),
                              _iconWithCount(Icons.repeat, data['reposts'] ?? 0),
                              const SizedBox(width: 32),
                              _iconWithCount(Icons.favorite_border, data['likes'] ?? 0),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        elevation: 8,
        child: const Icon(Icons.add, color: Colors.white, size: 32),
        onPressed: () => Get.to(() => const NewPostScreen()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _iconWithCount(IconData icon, int count) {
    return Row(
      children: [
        Icon(icon, size: 22, color: Colors.grey[700]),
        const SizedBox(width: 6),
        Text(
          "$count",
          style: TextStyle(color: Colors.grey[700], fontSize: 14),
        ),
      ],
    );
  }
}

// NewPostScreen stays the same — already perfect
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
        leading: IconButton(icon: const Icon(Icons.close, color: Colors.black), onPressed: () => Get.back()),
        actions: [
          TextButton(
            onPressed: () async {
              final text = controller.text.trim();
              if (text.isEmpty) return;
              await FirebaseFirestore.instance.collection('posts').add({
                'uid': user.uid,
                'username': user.displayName ?? 'User',
                'photoUrl': user.photoURL ?? '',
                'text': text,
                'timestamp': FieldValue.serverTimestamp(),
                'likes': 0,
                'replies': 0,
                'reposts': 0,
              });
              Get.back();
            },
            child: const Text("Post", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
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
