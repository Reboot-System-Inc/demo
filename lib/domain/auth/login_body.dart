// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginBody extends Equatable {
  final String phone;

  const LoginBody({
    required this.phone,
  });

  LoginBody copyWith({
    String? phone,
  }) {
    return LoginBody(
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
    };
  }

  factory LoginBody.fromMap(Map<String, String> map) {
    return LoginBody(
      phone: map['phone'] ?? '',
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [phone];

  String toJson() => json.encode(toMap());

  factory LoginBody.fromJson(String source) =>
      LoginBody.fromMap(json.decode(source) as Map<String, String>);

  @override
  String toString() => 'LoginBody(phone: $phone)';
}

class LoginOtpBody extends Equatable {
  final String phone;
  final int otp;

  const LoginOtpBody({
    required this.phone,
    required this.otp,
  });

  LoginOtpBody copyWith({
    String? phone,
    int? otp,
  }) {
    return LoginOtpBody(
      phone: phone ?? this.phone,
      otp: otp ?? this.otp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      'otp': otp,
    };
  }

  factory LoginOtpBody.fromMap(Map<String, dynamic> map) {
    return LoginOtpBody(
      phone: map['phone'] ?? '',
      otp: map['otp']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginOtpBody.fromJson(String source) =>
      LoginOtpBody.fromMap(json.decode(source));

  @override
  String toString() => 'LoginOtpBody(phone: $phone, otp: $otp)';

  @override
  List<Object> get props => [phone, otp];
}
