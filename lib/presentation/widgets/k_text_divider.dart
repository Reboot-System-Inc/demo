import '../../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KTextDivider extends HookConsumerWidget {
  const KTextDivider({
    super.key,
    this.padding = EdgeInsets.zero,
    required this.text,
  });

  final EdgeInsetsGeometry padding;
  final String text;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              endIndent: 32.w,
              thickness: 1.1,
              color: ColorPalate.harrisonGrey600,
            ),
          ),
          Text(
            text.toUpperCase(),
            style: CustomTextStyle.textStyle12w600HG1000
                .copyWith(letterSpacing: 1.5.w),
          ),
          Expanded(
            child: Divider(
              indent: 32.w,
              thickness: 1.1,
              color: ColorPalate.harrisonGrey600,
            ),
          )
        ],
      ),
    );
  }
}
