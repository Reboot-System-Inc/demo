import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../auth/model/address_info.dart';

class OrderResponse extends Equatable {
  final Data data;
  final bool success;
  final String message;
  OrderResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  OrderResponse copyWith({
    Data? data,
    bool? success,
    String? message,
  }) {
    return OrderResponse(
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

  factory OrderResponse.fromMap(Map<String, dynamic> map) {
    return OrderResponse(
      data: Data.fromMap(map['data']),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderResponse.fromJson(String source) =>
      OrderResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'OrderResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];

  factory OrderResponse.init() => OrderResponse(
        data: Data.init(),
        success: false,
        message: '',
      );
}

class Data extends Equatable {
  final String id;
  final String customer;
  final List<Order> orders;
  final String orderId;
  final AddressInfo addressInfo;
  final int paymentType;
  final int deliveryCharge;
  final int paymentStatus;
  final int totalBill;
  final int totalReceivedBill;
  final String createdAt;
  final String updatedAt;
  final int v;
  Data({
    required this.id,
    required this.customer,
    required this.orders,
    required this.orderId,
    required this.addressInfo,
    required this.paymentType,
    required this.deliveryCharge,
    required this.paymentStatus,
    required this.totalBill,
    required this.totalReceivedBill,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Data.init() => Data(
        id: '',
        customer: '',
        orders: const [],
        orderId: '',
        addressInfo: AddressInfo.init(),
        paymentType: 0,
        deliveryCharge: 0,
        paymentStatus: 0,
        totalBill: 0,
        totalReceivedBill: 0,
        createdAt: '',
        updatedAt: '',
        v: 0,
      );

  Data copyWith({
    String? id,
    String? customer,
    List<Order>? orders,
    String? orderId,
    AddressInfo? addressInfo,
    int? paymentType,
    int? deliveryCharge,
    int? paymentStatus,
    int? totalBill,
    int? totalReceivedBill,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return Data(
      id: id ?? this.id,
      customer: customer ?? this.customer,
      orders: orders ?? this.orders,
      orderId: orderId ?? this.orderId,
      addressInfo: addressInfo ?? this.addressInfo,
      paymentType: paymentType ?? this.paymentType,
      deliveryCharge: deliveryCharge ?? this.deliveryCharge,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      totalBill: totalBill ?? this.totalBill,
      totalReceivedBill: totalReceivedBill ?? this.totalReceivedBill,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'customer': customer,
      'orders': orders.map((x) => x.toMap()).toList(),
      'orderId': orderId,
      'addressInfo': addressInfo.toMap(),
      'paymentType': paymentType,
      'deliveryCharge': deliveryCharge,
      'paymentStatus': paymentStatus,
      'totalBill': totalBill,
      'totalReceivedBill': totalReceivedBill,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['_id'] ?? '',
      customer: map['customer'] ?? '',
      orders: List<Order>.from(
          map['orders']?.map((x) => Order.fromMap(x)) ?? const []),
      orderId: map['orderId'] ?? '',
      addressInfo: AddressInfo.fromMap(map['addressInfo']),
      paymentType: map['paymentType']?.toInt() ?? 0,
      deliveryCharge: map['deliveryCharge']?.toInt() ?? 0,
      paymentStatus: map['paymentStatus']?.toInt() ?? 0,
      totalBill: map['totalBill']?.toInt() ?? 0,
      totalReceivedBill: map['totalReceivedBill']?.toInt() ?? 0,
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      v: map['__v']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(_id: $id, customer: $customer, orders: $orders, orderId: $orderId, addressInfo: $addressInfo, paymentType: $paymentType, deliveryCharge: $deliveryCharge, paymentStatus: $paymentStatus, totalBill: $totalBill, totalReceivedBill: $totalReceivedBill, createdAt: $createdAt, updatedAt: $updatedAt, __v: $v)';
  }

  @override
  List<Object> get props {
    return [
      id,
      customer,
      orders,
      orderId,
      addressInfo,
      paymentType,
      deliveryCharge,
      paymentStatus,
      totalBill,
      totalReceivedBill,
      createdAt,
      updatedAt,
      v,
    ];
  }
}

class Order extends Equatable {
  final String id;
  final String vendor;
  final String parts;
  final String identificationNumber;
  final int partsAmount;
  final String image;
  final String car;
  final String details;
  final String type;
  final int customerBitAmount;
  final bool bidingAcceptByVendor;
  Order({
    required this.id,
    required this.vendor,
    required this.parts,
    required this.identificationNumber,
    required this.partsAmount,
    required this.image,
    required this.car,
    required this.details,
    required this.type,
    required this.customerBitAmount,
    required this.bidingAcceptByVendor,
  });

  Order copyWith({
    String? id,
    String? vendor,
    String? parts,
    String? identificationNumber,
    int? partsAmount,
    String? image,
    String? car,
    String? details,
    String? type,
    int? customerBitAmount,
    bool? bidingAcceptByVendor,
  }) {
    return Order(
      id: id ?? this.id,
      vendor: vendor ?? this.vendor,
      parts: parts ?? this.parts,
      identificationNumber: identificationNumber ?? this.identificationNumber,
      partsAmount: partsAmount ?? this.partsAmount,
      image: image ?? this.image,
      car: car ?? this.car,
      details: details ?? this.details,
      type: type ?? this.type,
      customerBitAmount: customerBitAmount ?? this.customerBitAmount,
      bidingAcceptByVendor: bidingAcceptByVendor ?? this.bidingAcceptByVendor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'vendor': vendor,
      'parts': parts,
      'identificationNumber': identificationNumber,
      'partsAmount': partsAmount,
      'image': image,
      'car': car,
      'details': details,
      'type': type,
      'customerBitAmount': customerBitAmount,
      'bidingAcceptByVendor': bidingAcceptByVendor,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['_id'] ?? '',
      vendor: map['vendor'] ?? '',
      parts: map['parts'] ?? '',
      identificationNumber: map['identificationNumber'] ?? '',
      partsAmount: map['partsAmount']?.toInt() ?? 0,
      image: map['image'] ?? '',
      car: map['car'] ?? '',
      details: map['details'] ?? '',
      type: map['type'] ?? '',
      customerBitAmount: map['customerBitAmount']?.toInt() ?? 0,
      bidingAcceptByVendor: map['bidingAcceptByVendor'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Order(_id: $id, vendor: $vendor, parts: $parts, identificationNumber: $identificationNumber, partsAmount: $partsAmount, image: $image, car: $car, details: $details, type: $type, customerBitAmount: $customerBitAmount, bidingAcceptByVendor: $bidingAcceptByVendor)';
  }

  @override
  List<Object> get props {
    return [
      id,
      vendor,
      parts,
      identificationNumber,
      partsAmount,
      image,
      car,
      details,
      type,
      customerBitAmount,
      bidingAcceptByVendor,
    ];
  }
}
