import 'package:cars_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonLoadingIndicator extends StatelessWidget {
  const CustomButtonLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 27.w,
      height: 27.h,
      child: const CircularProgressIndicator(
        color: AppColors.white,
        strokeWidth: 3,
      ),
    );
  }
}