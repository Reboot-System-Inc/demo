import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../domain/cart/model/address_model.dart';
import '../../domain/cart/model/cart_item_mode.dart';
import '../../domain/cart/model/cart_model.dart';
import '../../utils/network_util/network_failure.dart';

class CartState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final IList<CartModel> items;
  final AddressModel address;

  const CartState({
    required this.loading,
    required this.failure,
    required this.items,
    required this.address,
  });

  factory CartState.init() => CartState(
        loading: false,
        failure: CleanFailure.none(),
        items: cartItems.lock,
        address: AddressModel.init(),
      );

  CartState copyWith({
    bool? loading,
    CleanFailure? failure,
    IList<CartModel>? items,
    AddressModel? address,
  }) {
    return CartState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      items: items ?? this.items,
      address: address ?? this.address,
    );
  }

  @override
  String toString() {
    return 'CartState(loading: $loading, failure: $failure, items: $items, address: $address)';
  }

  @override
  List<Object> get props => [loading, failure, items, address];
}

final cartItems = [
  CartModel(
    isSelected: false,
    quantity: 1,
    product: CartItemModel.fromMap(const {
      "_id": "640381c7a42596a61a1e8823",
    }),
  )
];
