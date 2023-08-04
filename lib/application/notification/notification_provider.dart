import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../infrastructure/notification_repo.dart';
import 'notification_state.dart';

final notificationProvider =
    StateNotifierProvider<NotificationNotifier, NotificationState>((ref) {
  return NotificationNotifier(ref, NotificationRepo());
});

class NotificationNotifier extends StateNotifier<NotificationState> {
  final Ref ref;
  final NotificationRepo repo;
  NotificationNotifier(this.ref, this.repo) : super(NotificationState.init());

  void getNotification() async {
    state = state.copyWith(loading: true);
    final result = await repo.getNotification();
    result.fold(
      (l) => state = state.copyWith(
        loading: false,
        failure: l,
      ),
      (r) => state = state.copyWith(
        loading: false,
        notifications: r,
      ),
    );
  }
}
