import 'dart:convert';

import 'package:flutter_easylogger/flutter_logger.dart';

import '../domain/cart/order_body.dart';
import '../domain/cart/order_response.dart';
import '../domain/simple_response.dart';
import '../utils/utils.dart';

class CartRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, OrderResponse>> placeOrder(OrderBody body) async {
    final data = await api.post(
      endPoint: APIRoute.ORDER_CREATE,
      body: body.toMap(),
      fromData: (json) => OrderResponse.fromMap(json),
      withToken: true,
    );

    Logger.v("data: $data");

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) => right(r));
  }

  Future<Either<CleanFailure, SimpleResponse>> bidPart(
      String id, double price) async {
    final data = await api.post(
      endPoint: APIRoute.BIDDING_CREATE,
      body: {"id": id, "bidingAmount": price},
      fromData: (json) => SimpleResponse.fromMap(json),
      withToken: true,
    );

    Logger.v("data: $data");

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) => right(r));
  }
}
