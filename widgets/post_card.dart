import 'package:flutter/material.dart';

import '../constant/color.dart';

class PostCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const PostCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final text = data['text'] as String? ?? '';
    final likes = data['likes'] ?? 0;
    final replies = data['replies'] ?? 0;
    final reposts = data['reposts'] ?? 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header
          Row(
            children: const [
              CircleAvatar(
                radius: 20,
                backgroundColor: dark,
                child: Text(
                  'B',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Anonymous',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _iconWithCount(Icons.mode_comment_outlined, replies),
              const SizedBox(width: 16),
              _iconWithCount(Icons.repeat, reposts),
              const SizedBox(width: 16),
              _iconWithCount(Icons.favorite_border, likes),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconWithCount(IconData icon, int count) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(
          count.toString(),
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
