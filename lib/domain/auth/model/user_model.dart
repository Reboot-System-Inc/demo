import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'address_info.dart';

class UserModel extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String name;
  final String email;
  final String phone;
  final String profilePicture;
  final String myReferralCode;
  final String language;
  final String nameInArabic;
  final AddressInfo addressInfo;
  final String token;

  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.name,
    required this.email,
    required this.phone,
    required this.profilePicture,
    required this.myReferralCode,
    required this.language,
    required this.nameInArabic,
    required this.addressInfo,
    required this.token,
  });

  factory UserModel.init() => UserModel(
        id: '',
        firstName: "",
        lastName: '',
        name: '',
        email: '',
        phone: '',
        profilePicture: '',
        myReferralCode: '',
        language: '',
        nameInArabic: '',
        addressInfo: AddressInfo.init(),
        token: '',
      );

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? name,
    String? email,
    String? phone,
    String? profilePicture,
    String? myReferralCode,
    String? language,
    String? nameInArabic,
    AddressInfo? addressInfo,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profilePicture: profilePicture ?? this.profilePicture,
      myReferralCode: myReferralCode ?? this.myReferralCode,
      language: language ?? this.language,
      nameInArabic: nameInArabic ?? this.nameInArabic,
      addressInfo: addressInfo ?? this.addressInfo,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'name': name,
      'email': email,
      'phone': phone,
      'profilePicture': profilePicture,
      'myReferralCode': myReferralCode,
      'language': language,
      'nameInArabic': nameInArabic,
      'addressInfo': addressInfo.toMap(),
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
      myReferralCode: map['myReferralCode'] ?? '',
      language: map['language'] ?? '',
      nameInArabic: map['nameInArabic'] ?? '',
      addressInfo: AddressInfo.fromMap(map['addressInfo']),
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, name: $name, email: $email, phone: $phone, profilePicture: $profilePicture, myReferralCode: $myReferralCode, language: $language, nameInArabic: $nameInArabic, addressInfo: $addressInfo, token: $token)';
  }

  @override
  List<Object> get props {
    return [
      id,
      firstName,
      lastName,
      name,
      email,
      phone,
      profilePicture,
      myReferralCode,
      language,
      nameInArabic,
      addressInfo,
      token,
    ];
  }
}
