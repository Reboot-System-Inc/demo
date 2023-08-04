import 'dart:convert';

import 'package:equatable/equatable.dart';

class AddressInfo extends Equatable {
  final String address;
  final String city;

  const AddressInfo({
    required this.address,
    required this.city,
  });

  factory AddressInfo.init() => const AddressInfo(
        address: '',
        city: '',
      );

  AddressInfo copyWith({
    String? address,
    String? city,
  }) {
    return AddressInfo(
      address: address ?? this.address,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'city': city,
    };
  }

  factory AddressInfo.fromMap(Map<String, dynamic> map) {
    return AddressInfo(
      address: map['address'] ?? '',
      city: map['city'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressInfo.fromJson(String source) =>
      AddressInfo.fromMap(json.decode(source));

  @override
  String toString() => 'AddressInfo(address: $address, city: $city)';

  @override
  List<Object> get props => [address, city];
}
