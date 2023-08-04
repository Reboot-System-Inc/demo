import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginSendOtpResponse extends Equatable {
  final String data;
  final bool success;
  final String message;

  const LoginSendOtpResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  LoginSendOtpResponse copyWith({
    String? data,
    bool? success,
    String? message,
  }) {
    return LoginSendOtpResponse(
      data: data ?? this.data,
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'success': success,
      'message': message,
    };
  }

  factory LoginSendOtpResponse.fromMap(Map<String, dynamic> map) {
    return LoginSendOtpResponse(
      data: map['data'] ?? '',
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginSendOtpResponse.fromJson(String source) =>
      LoginSendOtpResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'LoginSendOtpResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
