// import 'dart:convert';

import '../domain/notification/notification_model.dart';
// import '../domain/simple_response.dart';
import '../utils/utils.dart';

class NotificationRepo {
  final api = NetworkHandler.instance;
  Future<Either<CleanFailure, List<NotificationModel>>>
      getNotification() async {
    return right([
      NotificationModel(id: ""),
    ]);
  }
}
