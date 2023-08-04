import 'dart:convert';

import '../domain/profile/review_body.dart';
import '../domain/simple_response.dart';
import '../utils/utils.dart';

class ProfileRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, SimpleResponse>> submitReviewRating(
      ReviewBody body) async {
    final data = await api.post(
      body: body.toMap(),
      fromData: (json) => SimpleResponse.fromMap(json),
      endPoint: APIRoute.SUBMIT_REVIEW,
      withToken: true,
    );

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) {
      return right(r);
    });
  }
}
