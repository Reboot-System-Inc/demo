import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/cart/model/address_model.dart';
import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.model, required this.onTap});

  final AddressModel model;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        KInkWell(
          onTap: onTap,
          backgroundColor: ColorPalate.white,
          borderRadius: radius6,
          padding: padding12,
          child: Row(
            crossAxisAlignment: crossCenter,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    Text(
                      model.fullName,
                      style: CustomTextStyle.textStyle14w600,
                    ),
                    Text(
                      model.phone,
                      style: CustomTextStyle.textStyle14w400,
                    ),
                    Text(
                      model.email,
                      style: CustomTextStyle.textStyle14w400,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: model.address,
                            style: CustomTextStyle.textStyle14w400,
                          ),
                          TextSpan(
                            text: '. ',
                            style: CustomTextStyle.textStyle14w400,
                          ),
                          TextSpan(
                            text: model.city,
                            style: CustomTextStyle.textStyle14w400,
                          ),
                          TextSpan(
                            text: '.',
                            style: CustomTextStyle.textStyle14w400,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: paddingRight4,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: ColorPalate.black,
                    size: 16.sp,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
