import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String id;
  final String content;
  final double mapX;
  final double mapY;
  final DateTime createdAt;

  Review({
    required this.id,
    required this.content,
    required this.mapX,
    required this.mapY,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json, String id) {
    return Review(
      id: id,
      content: json['content'],
      mapX: (json['mapX'] as num).toDouble(),
      mapY: (json['mapY'] as num).toDouble(),
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'mapX': mapX,
      'mapY': mapY,
      'createdAt': createdAt,
    };
  }
}
