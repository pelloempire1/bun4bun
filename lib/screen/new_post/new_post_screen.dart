import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _posting = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _posting) return;

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Get.snackbar('Error', 'You must be logged in to post.');
      return;
    }

    setState(() => _posting = true);

    try {
      await FirebaseFirestore.instance.collection('posts').add({
        'uid': user.uid,
        'username': user.displayName ?? 'Anonymous',
        'photoUrl': user.photoURL ?? '',
        'text': text,
        'timestamp': FieldValue.serverTimestamp(),
        'likes': 0,
        'replies': 0,
        'reposts': 0,
      });

      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'Failed to post: $e');
    } finally {
      if (mounted) {
        setState(() => _posting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: const Text(
          'New Post',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          TextButton(
            onPressed: _posting ? null : _submit,
            child: Text(
              _posting ? 'Posting...' : 'Post',
              style: TextStyle(
                color: _posting ? Colors.grey : Colors.blueAccent,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          autofocus: true,
          maxLines: null,
          style: const TextStyle(fontSize: 16, height: 1.4),
          decoration: const InputDecoration(
            hintText: "What's the tea?",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
