import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttter_locaquest/models/review.dart';

class ReviewRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveReview(Review review) async {
    await _firestore.collection('reviews').add(review.toJson());
  }

  Future<List<Review>> fetchReviewsByLocation(double mapX, double mapY) async {
    final query = await _firestore
        .collection('reviews')
        .where('mapX', isEqualTo: mapX)
        .where('mapY', isEqualTo: mapY)
        .orderBy('createdAt', descending: true)
        .get();

    return query.docs
        .map((doc) => Review.fromJson(doc.data(), doc.id))
        .toList();
  }
}
