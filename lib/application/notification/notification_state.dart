import 'package:equatable/equatable.dart';
import '../../domain/notification/notification_model.dart';
import '../../utils/utils.dart';

class NotificationState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final List<NotificationModel> notifications;

  const NotificationState({
    required this.loading,
    required this.failure,
    required this.notifications,
  });

  factory NotificationState.init() {
    return NotificationState(
      loading: false,
      failure: CleanFailure.none(),
      notifications: const [],
    );
  }

  NotificationState copyWith({
    bool? loading,
    CleanFailure? failure,
    List<NotificationModel>? notifications,
  }) {
    return NotificationState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  String toString() =>
      'NotificationState(loading: $loading, failure: $failure, notifications: $notifications)';

  @override
  List<Object> get props => [loading, failure, notifications];
}
