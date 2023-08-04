import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../utils/ui_constant.dart';
import '../../utils/utils.dart';

class KDivider extends StatelessWidget {
  const KDivider({
    Key? key,
    this.padding,
    this.color,
    this.thickness,
    this.height,
  }) : super(key: key);

  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? thickness;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Divider(
        thickness: thickness ?? 1.h,
        height: height ?? 0,
        color: color ?? ColorPalate.harrisonGrey600,
      ),
    );
  }
}
