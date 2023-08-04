import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../auth/model/address_info.dart';

class OrderBody extends Equatable {
  final List<String> orders;
  final String fullName;
  final String phone;
  final AddressInfo addressInfo;
  final int paymentType;
  const OrderBody({
    required this.orders,
    required this.fullName,
    required this.phone,
    required this.addressInfo,
    required this.paymentType,
  });

  OrderBody copyWith({
    List<String>? orders,
    String? fullName,
    String? phone,
    AddressInfo? addressInfo,
    int? paymentType,
  }) {
    return OrderBody(
      orders: orders ?? this.orders,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      addressInfo: addressInfo ?? this.addressInfo,
      paymentType: paymentType ?? this.paymentType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orders': orders,
      'fullName': fullName,
      'phone': phone,
      'addressInfo': addressInfo.toMap(),
      'paymentType': paymentType,
    };
  }

  factory OrderBody.fromMap(Map<String, dynamic> map) {
    return OrderBody(
      orders: List<String>.from(map['orders'] ?? const []),
      fullName: map['fullName'] ?? '',
      phone: map['phone'] ?? '',
      addressInfo: AddressInfo.fromMap(map['addressInfo']),
      paymentType: map['paymentType']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderBody.fromJson(String source) =>
      OrderBody.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderBody(orders: $orders, fullName: $fullName, phone: $phone, addressInfo: $addressInfo, paymentType: $paymentType)';
  }

  @override
  List<Object> get props {
    return [
      orders,
      fullName,
      phone,
      addressInfo,
      paymentType,
    ];
  }
}
