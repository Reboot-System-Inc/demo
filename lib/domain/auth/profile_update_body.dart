import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProfileUpdateBody extends Equatable {
  final String firstName;
  final String lastName;
  final String profilePicture;
  final String email;
  final String phone;
  const ProfileUpdateBody({
    required this.firstName,
    required this.lastName,
    required this.profilePicture,
    required this.email,
    required this.phone,
  });

  ProfileUpdateBody copyWith({
    String? firstName,
    String? lastName,
    String? profilePicture,
    String? email,
    String? phone,
  }) {
    return ProfileUpdateBody(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profilePicture: profilePicture ?? this.profilePicture,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'profilePicture': profilePicture,
      'email': email,
      'phone': phone,
    };
  }

  factory ProfileUpdateBody.fromMap(Map<String, dynamic> map) {
    return ProfileUpdateBody(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileUpdateBody.fromJson(String source) =>
      ProfileUpdateBody.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProfileUpdateBody(firstName: $firstName, lastName: $lastName, profilePicture: $profilePicture, email: $email, phone: $phone)';
  }

  @override
  List<Object> get props {
    return [
      firstName,
      lastName,
      profilePicture,
      email,
      phone,
    ];
  }
}
