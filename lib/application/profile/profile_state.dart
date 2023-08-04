import 'package:equatable/equatable.dart';

import '../../utils/utils.dart';

class ProfileState extends Equatable {
  final bool loading;
  final CleanFailure failure;

  const ProfileState({
    required this.loading,
    required this.failure,
  });

  factory ProfileState.init() {
    return ProfileState(
      loading: false,
      failure: CleanFailure.none(),
    );
  }

  ProfileState copyWith({
    bool? loading,
    CleanFailure? failure,
  }) {
    return ProfileState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
    );
  }

  @override
  String toString() => 'ProfileState(loading: $loading, failure: $failure)';

  @override
  List<Object> get props => [loading, failure];
}
