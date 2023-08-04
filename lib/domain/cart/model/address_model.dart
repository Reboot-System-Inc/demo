import 'dart:convert';

import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  final String fullName;
  final String phone;
  final String email;
  final String address;
  final String city;

  const AddressModel({
    required this.fullName,
    required this.phone,
    required this.email,
    required this.address,
    required this.city,
  });

  factory AddressModel.init() => const AddressModel(
        fullName: '',
        phone: '',
        email: '',
        address: '',
        city: '',
      );

  AddressModel copyWith({
    String? fullname,
    String? phone,
    String? email,
    String? address,
    String? city,
  }) {
    return AddressModel(
      fullName: fullname ?? this.fullName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullName,
      'phone': phone,
      'email': email,
      'address': address,
      'city': city,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      fullName: map['fullname'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      city: map['city'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddressModel(fullname: $fullName, phone: $phone, email: $email, address: $address, city: $city)';
  }

  @override
  List<Object> get props {
    return [
      fullName,
      phone,
      email,
      address,
      city,
    ];
  }
}

const myAddress = AddressModel(
  fullName: 'Banu Elson',
  phone: "+654 554 584",
  email: "email@mail.com",
  address: "4517 Washington Ave",
  city: "Manchester",
);
