import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/home_data.dart';

// ignore: must_be_immutable
class HomeResponse extends Equatable {
  final HomeData data;
  final bool success;
  final String message;

  const HomeResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  factory HomeResponse.init() => HomeResponse(
        data: HomeData.init(),
        success: false,
        message: '',
      );

  HomeResponse copyWith({
    HomeData? data,
    bool? success,
    String? message,
  }) {
    return HomeResponse(
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

  factory HomeResponse.fromMap(Map<String, dynamic> map) {
    return HomeResponse(
      data: HomeData.fromMap(map['data']),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeResponse.fromJson(String source) =>
      HomeResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'HomeResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
