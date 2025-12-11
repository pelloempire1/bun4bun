import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_mobile_app/constant/color.dart';
import 'package:social_mobile_app/constant/widget/primarybutton.dart';
import 'package:social_mobile_app/constant/widget/text_widget.dart';
import 'package:social_mobile_app/screen/discover/controller/postcontroller.dart';
import 'package:social_mobile_app/services/bun_service.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final postcontroller = Get.put(PostController());
  final TextEditingController _textController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  final BunService _bunService = const BunService();

  XFile? _pickedImage;
  bool _isSending = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? file = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (file != null) {
        setState(() => _pickedImage = file);
      }
    } catch (e) {
      Get.snackbar('Error', 'Could not pick image: $e');
    }
  }

  Future<String?> _uploadImageIfNeeded() async {
    if (_pickedImage == null) return null;

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return null;

      final file = File(_pickedImage!.path);
      final ref = FirebaseStorage.instance
          .ref()
          .child('post_images')
          .child('${user.uid}_${DateTime.now().millisecondsSinceEpoch}.jpg');

      await ref.putFile(file);

      return await ref.getDownloadURL();
    } catch (e) {
      Get.snackbar('Error', 'Image upload failed: $e');
      return null;
    }
  }

  Future<void> _sendPost() async {
    final text = _textController.text.trim();

    if (text.isEmpty) {
      Get.snackbar('Error', 'Please write something before sending.');
      return;
    }

    setState(() => _isSending = true);

    try {
      final imageUrl = await _uploadImageIfNeeded();
      await _bunService.createBunPost(text, imageUrl: imageUrl);

      Get.snackbar('Success', 'Your tea has been posted!');
      _textController.clear();
      setState(() => _pickedImage = null);
      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'Failed to post: $e');
    } finally {
      if (mounted) {
        setState(() => _isSending = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mint,
      appBar: AppBar(
        backgroundColor: mint,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: kronaText('Add Tea', black, 18),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PHOTO PICKER
            kronaText('Photo', black, 16),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(4, 4),
                      blurRadius: 0,
                      spreadRadius: 0,
                      color: black,
                    ),
                  ],
                ),
                child: _pickedImage == null
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.add_a_photo_outlined,
                              size: 40,
                              color: black,
                            ),
                            const SizedBox(height: 8),
                            robotoText(
                              'Tap to add a photo (optional)',
                              black,
                              14,
                            ),
                          ],
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          File(_pickedImage!.path),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 24),

            // CAPTION
            kronaText('Caption', black, 16),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: black,
                  ),
                ],
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                controller: _textController,
                maxLines: 5,
                onChanged: (value) {
                  postcontroller.length.value = value.length;
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Spill your tea here...',
                ),
              ),
            ),
            const SizedBox(height: 8),
            Obx(
              () => Align(
                alignment: Alignment.centerRight,
                child: robotoText(
                  '${postcontroller.length.value}/280',
                  black,
                  12,
                ),
              ),
            ),
            const SizedBox(height: 30),

            primaryButton(
              text: _isSending ? 'Posting...' : 'Post',
              onpress: _isSending ? null : _sendPost,
            ),
          ],
        ),
      ),
    );
  }
}
