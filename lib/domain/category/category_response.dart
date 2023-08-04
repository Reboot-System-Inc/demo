import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/category.dart';

class CategoryResponse extends Equatable {
  final List<CategoryModel> data;
  final bool success;
  const CategoryResponse({
    required this.data,
    required this.success,
  });

  factory CategoryResponse.init() =>
      const CategoryResponse(data: [], success: false);

  CategoryResponse copyWith({
    List<CategoryModel>? data,
    bool? success,
  }) {
    return CategoryResponse(
      data: data ?? this.data,
      success: success ?? this.success,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
      'success': success,
    };
  }

  factory CategoryResponse.fromMap(Map<String, dynamic> map) {
    return CategoryResponse(
      data: List<CategoryModel>.from(
          map['data']?.map((x) => CategoryModel.fromMap(x)) ?? const []),
      success: map['success'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryResponse.fromJson(String source) =>
      CategoryResponse.fromMap(json.decode(source));

  @override
  String toString() => 'CategoryResponse(data: $data, success: $success)';

  @override
  List<Object> get props => [data, success];
}
