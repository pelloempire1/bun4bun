import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/color.dart';
import '../post/post_detail_screen.dart';

const allParishOption = 'All Parishes';
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

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  String _selectedParish = allParishOption;

  @override
  Widget build(BuildContext context) {
    Query<Map<String, dynamic>> query =
        FirebaseFirestore.instance.collection('posts');

    if (_selectedParish != allParishOption) {
      query = query.where('parish', isEqualTo: _selectedParish);
    }

    query = query.orderBy('timestamp', descending: true);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: mint.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.place_outlined, color: dark),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _selectedParish,
                      icon: const Icon(Icons.arrow_drop_down),
                      items: [
                        allParishOption,
                        ...jamaicanParishes,
                      ]
                          .map(
                            (p) => DropdownMenuItem<String>(
                              value: p,
                              child: Text(p),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() => _selectedParish = value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: query.snapshots(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snap.hasData || snap.data!.docs.isEmpty) {
                return const Center(child: Text('No buns yet. Be the first!'));
              }

              final docs = snap.data!.docs;

              return Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 80),
                child: GridView.builder(
                  itemCount: docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final doc = docs[index];
                    final data = doc.data() as Map<String, dynamic>;
                    return _PostTile(
                      postId: doc.id,
                      data: data,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PostTile extends StatelessWidget {
  final String postId;
  final Map<String, dynamic> data;

  const _PostTile({required this.postId, required this.data});

  @override
  Widget build(BuildContext context) {
    final text = (data['text'] ?? '') as String;
    final imageUrl = (data['imageUrl'] as String?) ?? '';
    final greenFlags = (data['greenFlags'] ?? 0) as int;
    final redFlags = (data['redFlags'] ?? 0) as int;
    final commentsCount = (data['commentsCount'] ?? 0) as int;

    return GestureDetector(
      onTap: () => Get.to(
        () => PostDetailScreen(postId: postId, data: data),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (imageUrl.isNotEmpty)
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _placeholder(text),
              )
            else
              _placeholder(text),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.45),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              right: 8,
              bottom: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _FooterButton(
                      icon: Icons.thumb_up_alt_outlined,
                      color: Colors.green,
                      count: greenFlags,
                      onTap: () => _incrementField('greenFlags'),
                    ),
                    _FooterButton(
                      icon: Icons.flag_outlined,
                      color: Colors.redAccent,
                      count: redFlags,
                      onTap: () => _incrementField('redFlags'),
                    ),
                    _FooterButton(
                      icon: Icons.chat_bubble_outline,
                      color: Colors.blueGrey,
                      count: commentsCount,
                      onTap: () => Get.to(
                        () => PostDetailScreen(postId: postId, data: data),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _incrementField(String field) async {
    await FirebaseFirestore.instance.collection('posts').doc(postId).update({
      field: FieldValue.increment(1),
    });
  }

  Widget _placeholder(String text) {
    return Container(
      color: mint,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            text.isEmpty ? 'Bun4Bun' : text,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(color: dark, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class _FooterButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final int count;
  final VoidCallback onTap;

  const _FooterButton({
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
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 4),
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
