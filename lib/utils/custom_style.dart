import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_palate.dart';

class CustomTextStyle {
  CustomTextStyle._();

  static TextStyle textStyle32w600 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.harrisonGrey1000,
    letterSpacing: 1.80,
  );

  static TextStyle textStyle30w700 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w900,
    color: ColorPalate.harrisonGrey1000,
    letterSpacing: 1.80,
  );

  static TextStyle textStyle24w700 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: ColorPalate.harrisonGrey1000,
  );

  static TextStyle textStyle18w600HG1000 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.harrisonGrey1000,
  );

  static TextStyle textStyle18w500HG1000 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.harrisonGrey1000,
  );

  static TextStyle textStyle18w500Red = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.error,
  );

  static TextStyle textStyle18w500HG800 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.harrisonGrey800,
  );

  static TextStyle textStyle16w600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  );

  static TextStyle textStyle16w600White = textStyle16w600.copyWith(
    color: ColorPalate.white,
  );

  static TextStyle textStyle16w600secondary = textStyle16w600.copyWith(
    color: ColorPalate.secondary,
  );

  static TextStyle textStyle16w600HG900 = textStyle16w600.copyWith(
    color: ColorPalate.harrisonGrey900,
    letterSpacing: 0,
  );

  static TextStyle textStyle16w600HG1000 = textStyle16w600.copyWith(
    color: ColorPalate.harrisonGrey1000,
    letterSpacing: .15,
  );

  static TextStyle textStyle16w500HG1000 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.harrisonGrey1000,
  );

  static TextStyle textStyle16w500HG900 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.harrisonGrey900,
  );

  static TextStyle textStyle16w400HG1000 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.harrisonGrey1000,
  );

  static TextStyle textStyle16w400HG900 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.harrisonGrey900,
  );

  static TextStyle textStyle16w400secondary = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.secondary,
  );

  static TextStyle textStyle14w600 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.black,
  );

  static TextStyle textStyle14w600secondary = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.secondary,
  );

  static TextStyle textStyle14w500HG1000 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.harrisonGrey1000,
  );

  static TextStyle textStyle14w500HG900 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.harrisonGrey900,
  );

  static TextStyle textStyle14w500HG800 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.harrisonGrey800,
  );

  static TextStyle textStyle14w500Red = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.error,
  );

  static TextStyle textStyle14w500Primary = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.primary,
  );

  static TextStyle textStyle14w400 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textStyle14w400HG900 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.harrisonGrey900,
  );

  static TextStyle textStyle14w400HG800 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.harrisonGrey800,
  );

  static TextStyle textStyle13w400HG800 = GoogleFonts.inter(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.harrisonGrey800,
  );

  static TextStyle textStyle12w600Secondary = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.secondary,
  );

  static TextStyle textStyle12w600HG1000 = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.harrisonGrey1000,
  );

  static TextStyle textStyle12w500Secondary = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.secondary,
  );

  static TextStyle textStyle12w500HG800 = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.harrisonGrey800,
  );

  static TextStyle textStyle12w400HG800 = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.harrisonGrey800,
  );

  static TextStyle textStyle10w600Secondary = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.secondary,
  );

  static TextStyle textStyle8w600White = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w600,
  );
}
