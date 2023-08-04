import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/user_model.dart';

class LoginResponse extends Equatable {
  final UserModel data;
  final bool success;
  final String message;

  const LoginResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  LoginResponse copyWith({
    UserModel? data,
    bool? success,
    String? message,
  }) {
    return LoginResponse(
      data: data ?? this.data,
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.toMap(),
      'success': success,
      'message': message,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      data: UserModel.fromMap(map['data']),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'LoginResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
