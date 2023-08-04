import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/cart/model/address_model.dart';
import '../../domain/cart/model/cart_model.dart';
import '../../domain/cart/order_body.dart';
import '../../domain/cart/order_response.dart';
import '../../infrastructure/cart_repo.dart';
import '../../utils/utils.dart';
import '../global.dart';
import 'cart_state.dart';

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier(ref, CartRepo());
}, name: 'cartProvider');

class CartNotifier extends StateNotifier<CartState> {
  final Ref ref;
  final CartRepo repo;
  CartNotifier(this.ref, this.repo) : super(CartState.init());

  void setAddress(
    AddressModel address,
  ) {
    state = state.copyWith(
      address: address,
    );
  }

  void addToCart(CartModel model) {
    state = state.copyWith(items: state.items.add(model));
  }

  void removeFromCart(List<CartModel> items) {
    state = state.copyWith(items: state.items.removeAll(items));
  }

  void clearCart() {
    state = state.copyWith(items: state.items.clear());
  }

  void updateItem(CartModel model, {int? quantity, bool? isSelected}) {
    state = state.copyWith(
      items: state.items
          .map((e) {
            if (e == model) {
              return e.copyWith(quantity: quantity, isSelected: isSelected);
            }
            return e;
          })
          .toList()
          .lock,
    );
  }

  void toggolAll(bool? isSelected) {
    state = state.copyWith(
      items: state.items
          .map((e) {
            return e.copyWith(isSelected: isSelected);
          })
          .toList()
          .lock,
    );
  }

  Future<Either<CleanFailure, OrderResponse>> placeOrder(OrderBody body) async {
    // ignore: unused_local_variable
    bool success = false;
    state = state.copyWith(loading: true);

    final result = await repo.placeOrder(body);

    state = result.fold(
      (l) {
        showErrorToast(l.error);
        return state = state.copyWith(failure: l, loading: false);
      },
      (r) {
        showToast(r.message);
        success = r.success;
        return state.copyWith(loading: false);
      },
    );
    return result;
  }
}
