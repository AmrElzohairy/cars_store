import 'package:cars_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle font20SemiBoldPrimary = const TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle font14RegularBlack = const TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textFieldStyle = const TextStyle(
    color: AppColors.cadetGray,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle buttonStyle = const TextStyle(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font14MediumPrimaryWithOpacity = TextStyle(
    color: AppColors.textPrimary.withValues(alpha: 0.4),
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font14MediumPrimaryPrimaryColor = const TextStyle(
    color: AppColors.primaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font15SemiBoldWhite = const TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
}
