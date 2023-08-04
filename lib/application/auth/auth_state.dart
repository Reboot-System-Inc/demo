// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import '../../domain/auth/model/user_model.dart';
import '../../utils/network_util/network_handler.dart';

class AuthState extends Equatable {
  final UserModel user;
  final bool loading;
  final CleanFailure failure;
  final String language;

  const AuthState({
    required this.user,
    required this.loading,
    required this.failure,
    required this.language,
  });

  factory AuthState.init() => AuthState(
        user: UserModel.init(),
        loading: false,
        failure: CleanFailure.none(),
        language: 'English',
      );

  AuthState copyWith({
    UserModel? user,
    bool? loading,
    CleanFailure? failure,
    String? language,
  }) {
    return AuthState(
      user: user ?? this.user,
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      language: language ?? this.language,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [user, loading, failure, language];

  @override
  String toString() {
    return 'AuthState(user: $user, loading: $loading, failure: $failure, language: $language)';
  }
}
