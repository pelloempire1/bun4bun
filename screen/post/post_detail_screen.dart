import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';

class PostDetailScreen extends StatefulWidget {
  final String postId;
  final Map<String, dynamic> data;
  const PostDetailScreen({
    super.key,
    required this.postId,
    required this.data,
  });

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  late int _greenFlags;
  late int _redFlags;
  late int _commentsCount;
  final _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _greenFlags = (widget.data['greenFlags'] ?? 0) as int;
    _redFlags = (widget.data['redFlags'] ?? 0) as int;
    _commentsCount = (widget.data['commentsCount'] ?? 0) as int;
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _incrementField(String field) async {
    setState(() {
      if (field == 'greenFlags') _greenFlags++;
      if (field == 'redFlags') _redFlags++;
    });
    await FirebaseFirestore.instance.collection('posts').doc(widget.postId).update({
      field: FieldValue.increment(1),
    });
  }

  Future<void> _addComment() async {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You must be logged in to comment')),
      );
      return;
    }

    final comment = {
      'uid': user.uid,
      'username': user.displayName ?? 'User',
      'text': text,
      'timestamp': FieldValue.serverTimestamp(),
    };

    try {
      final postRef = FirebaseFirestore.instance.collection('posts').doc(widget.postId);
      await postRef.collection('comments').add(comment);
      await postRef.update({'commentsCount': FieldValue.increment(1)});
      setState(() {
        _commentsCount++;
        _commentController.clear();
      });
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to add comment')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.data['imageUrl'] as String?;
    final text = (widget.data['text'] ?? '') as String;
    final username = (widget.data['username'] ?? 'Post') as String;
    final parish = widget.data['parish'] as String?;

    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        title: Text(username),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: SizedBox(
                    height: 240,
                    child: imageUrl != null && imageUrl.isNotEmpty
                        ? Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => _placeholder(text),
                          )
                        : _placeholder(text),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  text,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: dark),
                ),
                const SizedBox(height: 8),
                if (parish != null && parish.isNotEmpty)
                  Row(
                    children: [
                      const Icon(Icons.place_outlined, size: 18, color: dark),
                      const SizedBox(width: 6),
                      Text(
                        parish,
                        style: const TextStyle(color: dark),
                      ),
                    ],
                  ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _ActionButton(
                        icon: Icons.thumb_up_alt_outlined,
                        color: Colors.green,
                        count: _greenFlags,
                        onTap: () => _incrementField('greenFlags'),
                      ),
                      _ActionButton(
                        icon: Icons.flag_outlined,
                        color: Colors.redAccent,
                        count: _redFlags,
                        onTap: () => _incrementField('redFlags'),
                      ),
                      _ActionButton(
                        icon: Icons.chat_bubble_outline,
                        color: Colors.blueGrey,
                        count: _commentsCount,
                        onTap: () {}, // comments displayed below
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Comments',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('posts')
                      .doc(widget.postId)
                      .collection('comments')
                      .orderBy('timestamp', descending: false)
                      .snapshots(),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.all(12),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    if (!snap.hasData || snap.data!.docs.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text('No comments yet.'),
                      );
                    }

                    final docs = snap.data!.docs;
                    return Column(
                      children: docs.map((doc) {
                        final data = doc.data() as Map<String, dynamic>;
                        final commentUser = (data['username'] ?? 'User') as String;
                        final commentText = (data['text'] ?? '') as String;
                        final ts = data['timestamp'] as Timestamp?;
                        final timeString = ts != null ? ts.toDate().toLocal().toString() : '...';
                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                commentUser,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(commentText),
                              const SizedBox(height: 4),
                              Text(
                                timeString,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: const InputDecoration(
                      hintText: 'Add a comment...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: grey,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _addComment,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _placeholder(String text) {
    return Container(
      color: mint,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            text.isEmpty ? 'Bun4Bun' : text,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(color: dark, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final int count;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.color,
    required this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 6),
          Text(
            count.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: dark,
            ),
          ),
        ],
      ),
    );
  }
}
