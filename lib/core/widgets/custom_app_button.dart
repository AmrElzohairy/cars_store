import 'package:cars_store/core/utils/app_colors.dart';
import 'package:cars_store/core/utils/app_styles.dart';
import 'package:cars_store/core/widgets/custom_button_loading_indicator.dart';
import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isLoading,
  });
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child:
            isLoading
                ? const CustomButtonLoadingIndicator()
                : Text(text, style: AppStyles.buttonStyle),
      ),
    );
  }
}
