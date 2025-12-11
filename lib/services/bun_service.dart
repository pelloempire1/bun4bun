import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_mobile_app/model/bun_post.dart';

class BunService {
  const BunService();

  CollectionReference<Map<String, dynamic>> get _postsRef =>
      FirebaseFirestore.instance.collection('posts');

  /// Create a new tea/bun post
  Future<void> createBunPost(
    String text, {
    String? imageUrl,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }

    final now = DateTime.now();
    final docRef = _postsRef.doc();

    final post = BunPost(
      id: docRef.id,
      authorId: user.uid,
      text: text,
      status: 'active',
      createdAt: now,
      hotTea: 0,
      redFlag: 0,
      bun: 0,
      reportsCount: 0,
      imageUrl: imageUrl,
    );

    await docRef.set(post.toMap());
  }

  /// Live feed for the Tea screen
  Stream<List<BunPost>> bunFeedStream() {
    return _postsRef
        .where('status', isEqualTo: 'active')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map(BunPost.fromDoc).toList(),
        );
  }

  /// Increment a reaction counter using a dotted field path, e.g. 'reactions.hotTea'
  Future<void> reactToPost(String postId, String fieldPath) async {
    await _postsRef.doc(postId).update({
      fieldPath: FieldValue.increment(1),
    });
  }
}
