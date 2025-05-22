import 'package:cars_store/core/utils/app_colors.dart';
import 'package:cars_store/core/utils/responsive_text.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle font20SemiBoldPrimary(BuildContext context) => TextStyle(
    color: AppColors.textPrimary,
    fontSize: getResponsiveFontSize(context, fontSize: 20),
    fontWeight: FontWeight.w600,
  );

  static TextStyle font14RegularBlack(BuildContext context) => TextStyle(
    color: AppColors.black,
    fontSize: getResponsiveFontSize(context, fontSize: 14),
    fontWeight: FontWeight.w400,
  );

  static TextStyle font16RegularBlackWithOpacity(BuildContext context) =>
      TextStyle(
        color: AppColors.black.withValues(alpha: 0.6),
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w400,
      );

  static TextStyle textFieldStyle(BuildContext context) => TextStyle(
    color: AppColors.cadetGray,
    fontSize: getResponsiveFontSize(context, fontSize: 16),
    fontWeight: FontWeight.w600,
  );

  static TextStyle buttonStyle(BuildContext context) => TextStyle(
    color: AppColors.white,
    fontSize: getResponsiveFontSize(context, fontSize: 18),
    fontWeight: FontWeight.w600,
  );

  static TextStyle font14MediumPrimaryWithOpacity(BuildContext context) =>
      TextStyle(
        color: AppColors.textPrimary.withValues(alpha: 0.4),
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w500,
      );

  static TextStyle font18MediumPrimaryWithOpacity(BuildContext context) =>
      TextStyle(
        color: AppColors.textPrimary.withValues(alpha: 0.4),
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w500,
      );

  static TextStyle font14MediumPrimaryPrimaryColor(BuildContext context) =>
      TextStyle(
        color: AppColors.primaryColor,
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w500,
      );

  static TextStyle font15SemiBoldWhite(BuildContext context) => TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(context, fontSize: 15),
    fontWeight: FontWeight.w600,
  );

  static TextStyle font16BoldWhite(BuildContext context) => TextStyle(
    color: AppColors.white,
    fontSize: getResponsiveFontSize(context, fontSize: 16),
    fontWeight: FontWeight.w700,
  );
  static TextStyle font18BoldBlack(BuildContext context) => TextStyle(
    color: AppColors.black,
    fontSize: getResponsiveFontSize(context, fontSize: 18),
    fontWeight: FontWeight.w700,
  );
  static TextStyle font20BoldBlack(BuildContext context) => TextStyle(
    color: AppColors.black,
    fontSize: getResponsiveFontSize(context, fontSize: 20),
    fontWeight: FontWeight.w700,
  );

  static TextStyle font20MediumBlack(BuildContext context) => TextStyle(
    color: AppColors.textPrimary,
    fontSize: getResponsiveFontSize(context, fontSize: 20),
    fontWeight: FontWeight.w500,
  );
  static TextStyle font16MediumPrimary(BuildContext context) => TextStyle(
    color: AppColors.primaryColor,
    fontSize: getResponsiveFontSize(context, fontSize: 16),
    fontWeight: FontWeight.w500,
  );
  static TextStyle font14MediumBlack(BuildContext context) => TextStyle(
    color: AppColors.black,
    fontSize: getResponsiveFontSize(context, fontSize: 14),
    fontWeight: FontWeight.w500,
  );
  static TextStyle font15MediumBlack(BuildContext context) => TextStyle(
    color: AppColors.black,
    fontSize: getResponsiveFontSize(context, fontSize: 15),
    fontWeight: FontWeight.w500,
  );

  static TextStyle font12MediumPrimaryBlackWithOpacity(BuildContext context) =>
      TextStyle(
        color: AppColors.textPrimary.withValues(alpha: 0.5),
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontWeight: FontWeight.w500,
        letterSpacing: -0.41,
      );

  static TextStyle font16MediumBlack(BuildContext context) => TextStyle(
    color: AppColors.black,
    fontSize: getResponsiveFontSize(context, fontSize: 16),
    fontWeight: FontWeight.w500,
  );
}
