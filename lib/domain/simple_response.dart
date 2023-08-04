import 'dart:convert';

import 'package:equatable/equatable.dart';

class SimpleResponse extends Equatable {
  final bool success;
  final String message;

  const SimpleResponse({
    required this.success,
    required this.message,
  });

  SimpleResponse copyWith({
    bool? success,
    String? message,
  }) {
    return SimpleResponse(
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
    };
  }

  factory SimpleResponse.fromMap(Map<String, dynamic> map) {
    return SimpleResponse(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SimpleResponse.fromJson(String source) =>
      SimpleResponse.fromMap(json.decode(source));

  @override
  String toString() => 'SimpleResponse(success: $success, message: $message)';

  @override
  List<Object> get props => [success, message];
}
