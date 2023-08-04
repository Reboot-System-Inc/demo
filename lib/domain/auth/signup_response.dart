// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/user_model.dart';

class AuthResponse extends Equatable {
  final UserModel user;
  final bool success;
  final String message;

  const AuthResponse({
    required this.user,
    required this.success,
    required this.message,
  });

  AuthResponse copyWith({
    UserModel? user,
    bool? success,
    String? message,
  }) {
    return AuthResponse(
      user: user ?? this.user,
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
      'success': success,
      'message': message,
    };
  }

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      user: UserModel.fromMap(map['data']),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromJson(String source) =>
      AuthResponse.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [user, success, message];

  @override
  String toString() =>
      'AuthResponse(user: $user, success: $success, message: $message)';
}
