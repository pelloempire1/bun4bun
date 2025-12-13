import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import '../../constant/color.dart';

const jamaicanParishes = [
  'Kingston',
  'St. Andrew',
  'St. Catherine',
  'Clarendon',
  'Manchester',
  'St. Elizabeth',
  'Westmoreland',
  'Hanover',
  'St. James',
  'Trelawny',
  'St. Ann',
  'St. Mary',
  'Portland',
  'St. Thomas',
];

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final _controller = TextEditingController();
  bool _isPosting = false;
  bool _isUploadingImage = false;
  String? _selectedParish;
  File? _selectedImage;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _selectedImage = File(picked.path);
      });
    }
  }

  Future<void> _submit() async {
    final text = _controller.text.trim();
    if (_selectedParish == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a parish')),
      );
      return;
    }
    if (text.isEmpty) return;

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You must be logged in to post')),
      );
      return;
    }

    String imageUrl = '';

    try {
      setState(() {
        _isPosting = true;
        _isUploadingImage = _selectedImage != null;
      });

      if (_selectedImage != null) {
        final uid = user.uid;
        final filename = DateTime.now().millisecondsSinceEpoch.toString();
        final ref = FirebaseStorage.instance
            .ref()
            .child('posts')
            .child(uid)
            .child('$filename.jpg');

        await ref.putFile(_selectedImage!);
        imageUrl = await ref.getDownloadURL();
      }

      if (mounted) {
        setState(() => _isUploadingImage = false);
      }

      await FirebaseFirestore.instance.collection('posts').add({
        'uid': user.uid,
        'username': user.displayName ?? 'User',
        'imageUrl': imageUrl,
        'text': text,
        'timestamp': FieldValue.serverTimestamp(),
        'likes': 0,
        'replies': 0,
        'reposts': 0,
        'parish': _selectedParish,
        'greenFlags': 0,
        'redFlags': 0,
        'commentsCount': 0,
      });

      if (mounted) {
        setState(() {
          _controller.clear();
          _selectedImage = null;
        });
      }

      Get.back();
    } catch (_) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Failed to post')));
    } finally {
      if (mounted) {
        setState(() {
          _isPosting = false;
          _isUploadingImage = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isBusy = _isPosting || _isUploadingImage;

    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        title: const Text('New bun'),
        actions: [
          TextButton(
            onPressed: isBusy ? null : _submit,
            child: isBusy
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
            DropdownButtonFormField<String>(
              value: _selectedParish,
              icon: const Icon(Icons.arrow_drop_down),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Select parish',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
              items: jamaicanParishes
                  .map(
                    (p) => DropdownMenuItem<String>(
                      value: p,
                      child: Text(p),
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() => _selectedParish = value),
            ),
            const SizedBox(height: 12),
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
            if (_selectedImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.file(
                    _selectedImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            if (_selectedImage != null) const SizedBox(height: 12),
            InkWell(
              onTap: isBusy ? null : _pickImage,
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Row(
                  children: const [
                    Icon(Icons.image_outlined),
                    SizedBox(width: 8),
                    Text('Add photo'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
