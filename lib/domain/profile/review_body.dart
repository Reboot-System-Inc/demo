import 'dart:convert';

import 'package:equatable/equatable.dart';

class ReviewBody extends Equatable {
  final String id;
  final int rating;
  final String comment;

  const ReviewBody({
    required this.id,
    required this.rating,
    required this.comment,
  });

  ReviewBody copyWith({
    String? id,
    int? rating,
    String? comment,
  }) {
    return ReviewBody(
      id: id ?? this.id,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'rating': rating,
      'comment': comment,
    };
  }

  factory ReviewBody.fromMap(Map<String, dynamic> map) {
    return ReviewBody(
      id: map['id'] ?? '',
      rating: map['rating']?.toInt() ?? 0,
      comment: map['comment'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewBody.fromJson(String source) =>
      ReviewBody.fromMap(json.decode(source));

  @override
  String toString() =>
      'ReviewBody(id: $id, rating: $rating, comment: $comment)';

  @override
  List<Object> get props => [id, rating, comment];
}
