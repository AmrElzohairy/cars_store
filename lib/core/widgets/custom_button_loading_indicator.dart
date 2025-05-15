import 'package:cars_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtonLoadingIndicator extends StatelessWidget {
  const CustomButtonLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 27,
      height: 27,
      child: const CircularProgressIndicator(
        color: AppColors.white,
        strokeWidth: 3,
      ),
    );
  }
}
