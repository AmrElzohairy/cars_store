import 'package:cars_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle font20SemiBoldPrimary = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle font14RegularBlack = TextStyle(
    color: AppColors.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textFieldStyle = TextStyle(
    color: AppColors.cadetGray,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle buttonStyle = TextStyle(
    color: AppColors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font14MediumPrimaryWithOpacity = TextStyle(
    color: AppColors.textPrimary.withValues(alpha: 0.4),
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font14MediumPrimaryPrimaryColor = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font15SemiBoldWhite = TextStyle(
    color: Colors.white,
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
  );
}
