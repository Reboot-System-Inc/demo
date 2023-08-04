import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/utils.dart';

class TotalText extends HookConsumerWidget {
  const TotalText({super.key, required this.text1, required this.text2});

  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: CustomTextStyle.textStyle12w400HG800,
          ),
          Text(
            text2,
            style: CustomTextStyle.textStyle16w600,
          ),
        ],
      ),
    );
  }
}
