import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignupBody extends Equatable {
  final String firstName;
  final String lastName;
  final String phone;
  final String language;
  final String usedReferralCode;
  final String email;

  const SignupBody({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.language,
    required this.usedReferralCode,
    required this.email,
  });

  SignupBody copyWith({
    String? firstName,
    String? lastName,
    String? phone,
    String? language,
    String? usedReferralCode,
    String? email,
  }) {
    return SignupBody(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      language: language ?? this.language,
      usedReferralCode: usedReferralCode ?? this.usedReferralCode,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'language': language,
      'usedReferralCode': usedReferralCode,
      'email': email,
    };
  }

  factory SignupBody.fromMap(Map<String, dynamic> map) {
    return SignupBody(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      phone: map['phone'] ?? '',
      language: map['language'] ?? '',
      usedReferralCode: map['usedReferralCode'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupBody.fromJson(String source) =>
      SignupBody.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SIgnupBody(firstName: $firstName, lastName: $lastName, phone: $phone, language: $language, usedReferralCode: $usedReferralCode, email: $email)';
  }

  @override
  List<Object> get props {
    return [
      firstName,
      lastName,
      phone,
      language,
      usedReferralCode,
      email,
    ];
  }
}
