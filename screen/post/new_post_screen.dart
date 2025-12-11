import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/color.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final _controller = TextEditingController();
  bool _isPosting = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You must be logged in to post')),
      );
      return;
    }

    try {
      setState(() => _isPosting = true);

      await FirebaseFirestore.instance.collection('posts').add({
        'uid': user.uid,
        'username': user.displayName ?? 'User', // for your CMS
        'photoUrl': '', // will use this later for image
        'text': text,
        'timestamp': FieldValue.serverTimestamp(),
        'likes': 0,
        'replies': 0,
        'reposts': 0,
      });

      Get.back();
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to post')),
      );
    } finally {
      if (mounted) setState(() => _isPosting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        title: const Text('New bun'),
        actions: [
          TextButton(
            onPressed: _isPosting ? null : _submit,
            child: _isPosting
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Post'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: "What's the bun?",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Placeholder row for future image / options like Tea
            Row(
              children: const [
                Icon(Icons.image_outlined),
                SizedBox(width: 8),
                Text('Add photo (coming soon)'),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
