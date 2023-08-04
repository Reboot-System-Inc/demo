import 'package:equatable/equatable.dart';

class CartItemModel extends Equatable {
  final String id;
  const CartItemModel({
    required this.id,
  });

  CartItemModel copyWith({
    String? id,
  }) {
    return CartItemModel(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'] ?? '',
    );
  }

  @override
  String toString() => 'CartItemModel(id: $id)';

  @override
  List<Object> get props => [id];
}
