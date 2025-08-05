import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttter_locaquest/models/review.dart';
import 'package:fluttter_locaquest/repositories/review_repository.dart';

class ReviewViewModel extends AsyncNotifier<List<Review>> {
  final _repository = ReviewRepository();
  late double _mapX;
  late double _mapY;

  void setCoordinates(double mapX, double mapY) {
    _mapX = mapX;
    _mapY = mapY;
  }

  Future<void> loadReviews() async {
    state = const AsyncLoading();
    try {
      final reviews = await _repository.fetchReviewsByLocation(_mapX, _mapY);
      state = AsyncData(reviews);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> addReview(String content) async {
    final newReview = Review(
      id: '',
      content: content,
      mapX: _mapX,
      mapY: _mapY,
      createdAt: DateTime.now(),
    );
    await _repository.saveReview(newReview);
    await loadReviews();
  }

  @override
  FutureOr<List<Review>> build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}

final reviewProvider = AsyncNotifierProvider<ReviewViewModel, List<Review>>(
    () => ReviewViewModel());
