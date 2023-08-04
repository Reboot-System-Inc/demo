import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/cart/cart_provider.dart';
import '../../application/global.dart';
import '../widgets/widgets.dart';
import '../../utils/utils.dart';
import 'widgtes/cart_item.dart';

class CartScreen extends HookConsumerWidget {
  static const route = '/cart';
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProvider);

    final selectedItemsList =
        state.items.where((element) => element.isSelected).toList();

    final totalAmount = 0;
    // selectedItemsList.isEmpty
    //     ? 0
    //     : selectedItemsList
    //         .map((e) => e.product.amount * e.quantity)
    //         .reduce((value, element) => value + element);

    useEffect(() {
      // Future.microtask(() => ref.read(cartProvider.notifier).getMyBids());
      return null;
    }, const []);

    return Scaffold(
      backgroundColor: ColorPalate.white,
      appBar: KAppBar(
        titleText: 'My Cart (${state.items.length})',
        actions: [
          SizedBox(
            width: 80.w,
            child: TextButton(
              onPressed: () {
                ref
                    .read(cartProvider.notifier)
                    .removeFromCart(selectedItemsList);
              },
              child: Text(
                'Delete',
              ),
            ),
          ),
        ],
      ),
      body: KListViewSeparated(
        alternateWidget: const Center(
          child: Text("Cart Empty..."),
        ),
        itemCount: state.items.length,
        itemBuilder: (context, index) {
          final cartItem = state.items[index];
          return CartItem(model: cartItem);
        },
        separator: KDivider(
          height: 48.h,
          color: ColorPalate.harrisonGrey600,
        ),
      ),
      bottomNavigationBar: Container(
        height: 64.h,
        // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        padding: EdgeInsetsDirectional.only(
          end: 20.w,
          start: 6.w,
        ),
        decoration: BoxDecoration(
            color: ColorPalate.white,
            border: Border.symmetric(
              horizontal: BorderSide(
                color: ColorPalate.harrisonGrey600,
                width: .5.w,
              ),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: selectedItemsList.length == state.items.length,
                  // groupValue: true,
                  onChanged: (value) {
                    ref.read(cartProvider.notifier).toggolAll(value);
                  },
                  visualDensity: VisualDensity.compact,
                ),
                Text(
                  "All",
                ),
              ],
            ),
            Text(
              'Total: \$${ref.watch(digitLocalizationProvider(totalAmount))} SAR',
            ),
            SizedBox(
              width: 125.w,
              height: 40.h,
              child: KElevatedButton(
                isSecondary: true,
                text: 'Checkout (${selectedItemsList.length})',
                onPressed: selectedItemsList.isEmpty
                    ? null
                    : () {
                        // context.push(CheckoutScreen.route);
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
