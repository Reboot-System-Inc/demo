import 'package:equatable/equatable.dart';

import '../../domain/home/model/home_data.dart';
import '../../utils/network_util/network_handler.dart';

class HomeState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final HomeData homeData;
  final bool notification;
  final bool chatNotification;

  const HomeState({
    required this.loading,
    required this.failure,
    required this.homeData,
    required this.notification,
    required this.chatNotification,
  });

  factory HomeState.init() => HomeState(
        loading: false,
        failure: CleanFailure.none(),
        homeData: HomeData.init(),
        notification: false,
        chatNotification: false,
      );

  HomeState copyWith({
    bool? loading,
    CleanFailure? failure,
    HomeData? homeData,
    bool? notification,
    bool? chatNotification,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      homeData: homeData ?? this.homeData,
      notification: notification ?? this.notification,
      chatNotification: chatNotification ?? this.chatNotification,
    );
  }

  @override
  String toString() {
    return 'HomeState(loading: $loading, failure: $failure, homeData: $homeData, notification: $notification, chatNotification: $chatNotification)';
  }

  @override
  List<Object> get props {
    return [
      loading,
      failure,
      homeData,
      notification,
      chatNotification,
    ];
  }
}
