import 'package:cloud_firestore/cloud_firestore.dart';

class BunPost {
  final String id;
  final String authorId;
  final String text;
  final String status;
  final DateTime createdAt;
  final int hotTea;
  final int redFlag;
  final int bun;
  final int reportsCount;
  final String? imageUrl;

  BunPost({
    required this.id,
    required this.authorId,
    required this.text,
    required this.status,
    required this.createdAt,
    required this.hotTea,
    required this.redFlag,
    required this.bun,
    required this.reportsCount,
    this.imageUrl,
  });

  factory BunPost.fromDoc(
    QueryDocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();

    return BunPost(
      id: doc.id,
      authorId: data['authorId'] as String? ?? '',
      text: data['text'] as String? ?? '',
      status: data['status'] as String? ?? 'active',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      hotTea: data['reactions']?['hotTea'] as int? ??
          data['hotTea'] as int? ??
          0,
      redFlag: data['reactions']?['redFlag'] as int? ??
          data['redFlag'] as int? ??
          0,
      bun: data['reactions']?['bun'] as int? ?? data['bun'] as int? ?? 0,
      reportsCount: data['reportsCount'] as int? ?? 0,
      imageUrl: data['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'authorId': authorId,
      'text': text,
      'status': status,
      'createdAt': Timestamp.fromDate(createdAt),
      'reportsCount': reportsCount,
      'imageUrl': imageUrl,
      'reactions': {
        'hotTea': hotTea,
        'redFlag': redFlag,
        'bun': bun,
      },
    };
  }
}
