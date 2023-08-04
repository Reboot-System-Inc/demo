import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/cart/cart_provider.dart';
// import '../../../application/global.dart';
import '../../../domain/cart/model/cart_model.dart';
import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';

class CartItem extends HookConsumerWidget {
  const CartItem({Key? key, required this.model, this.isCheckout = false})
      : super(key: key);

  final CartModel model;
  final bool isCheckout;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isNew = model.product.type == "new";

    return Container(
      padding: isCheckout ? padding12 : null,
      decoration: BoxDecoration(
        color: isCheckout ? ColorPalate.white : null,
        borderRadius: radius6,
      ),
      child: Row(
        children: [
          Visibility(
            visible: !isCheckout,
            child: Checkbox(
                value: model.isSelected,
                onChanged: (value) {
                  ref
                      .read(cartProvider.notifier)
                      .updateItem(model, isSelected: value);
                }),
          ),
          // KCachedNetworkImageNoBase(
          //   imageUrl: model.product.image,
          //   width: 64.w,
          //   height: 64.w,
          //   borderRadius: radius6,
          //   borderColor: ColorPalate.harrisonGrey600,
          // ),
          gap10,
          //   Expanded(
          //     child: Column(
          //       mainAxisAlignment: mainStart,
          //       crossAxisAlignment: crossStart,
          //       children: [
          //         Text(
          //           model.product.parts.name,
          //           textAlign: TextAlign.start,
          //           style: CustomTextStyle.textStyle14w600,
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               model.product.vendor.companyName,
          //               style: CustomTextStyle.textStyle12w400Subtitle,
          //             ),
          //             Container(
          //               margin: paddingRight6,
          //               padding: EdgeInsetsDirectional.symmetric(
          //                 horizontal: 4.w,
          //                 vertical: 2.h,
          //               ),
          //               decoration: BoxDecoration(
          //                 color: isNew
          //                     ? const Color(0xffDFF3E7)
          //                     : const Color(0xffEFE4E0),
          //                 borderRadius: radius4,
          //               ),
          //               child: Text(
          //                 model.product.type,
          //                 style: CustomTextStyle.textStyle8w600.copyWith(
          //                   color: isNew
          //                       ? ColorPalate.success
          //                       : const Color(0xff9C5134),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //         gap4,
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               "\$${ref.watch(digitLocalizationProvider(model.product.amount))}/SAR",
          //               style: CustomTextStyle.textStyle14w600Secondary,
          //             ),
          //             isCheckout
          //                 ? Text(
          //                     "Qty: ${ref.watch(digitLocalizationProvider(model.quantity))}",
          //                     style: CustomTextStyle.textStyle12w400Black3,
          //                   )
          //                 : PlusMinusButtons(
          //                     addQuantity: () {
          //                       ref.read(cartProvider.notifier).updateItem(model,
          //                           quantity: model.quantity + 1);
          //                     },
          //                     text: ref.watch(
          //                         digitLocalizationProvider(model.quantity)),
          //                     deleteQuantity: () {
          //                       if (model.quantity > 1) {
          //                         ref.read(cartProvider.notifier).updateItem(
          //                             model,
          //                             quantity: model.quantity - 1);
          //                       }
          //                     },
          //                   ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
        ],
      ),
    );
  }
}

class PlusMinusButtons extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback addQuantity;
  final String text;
  const PlusMinusButtons(
      {Key? key,
      required this.addQuantity,
      required this.deleteQuantity,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 26.w,
          height: 22.w,
          decoration: BoxDecoration(
            borderRadius: radius4,
            color: ColorPalate.harrisonGrey600,
          ),
          child: KInkWell(
            onTap: deleteQuantity,
            child: Icon(Icons.remove, size: 12.sp),
          ),
        ),
        gap8,
        Text(text, style: CustomTextStyle.textStyle12w600HG1000),
        gap8,
        Container(
          width: 26.w,
          height: 22.w,
          decoration: BoxDecoration(
            borderRadius: radius4,
            color: ColorPalate.harrisonGrey600,
          ),
          child: KInkWell(
            onTap: addQuantity,
            child: Icon(Icons.add, size: 12.sp),
          ),
        ),
        gap6,
      ],
    );
  }
}
