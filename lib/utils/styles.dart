import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';

class AppStyles {
  final TextStyle bodyFont = GoogleFonts.rubik(
    color: appColors.blueColor,
    fontSize: 14.sp,
  );
  final TextStyle smallBodyFont = GoogleFonts.rubik(
    color: appColors.blueColor,
    fontSize: 12.sp,
  );
  final TextStyle titleFont = GoogleFonts.rubik(
    fontSize: 18.sp,
    color: appColors.blueColor,
    fontWeight: FontWeight.bold,
  );
  final TextStyle headerFont = GoogleFonts.rubik(
    fontSize: 22.sp,
    color: appColors.blueColor,
    fontWeight: FontWeight.bold,
  );
  final OutlineInputBorder appBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      color: appColors.blueColor,
    ),
    gapPadding: 10.sp,
  );
  final textButtonStyle = TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
        // side: BorderSide(color: appColors.blueColor),
      ),
      foregroundColor: appColors.blueColor,
      backgroundColor: appColors.whiteColor,
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
    ),
  );
  final elevatedButtonStyle = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      foregroundColor: appColors.whiteColor,
      backgroundColor: appColors.blueColor,
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
    ),
  );
}
