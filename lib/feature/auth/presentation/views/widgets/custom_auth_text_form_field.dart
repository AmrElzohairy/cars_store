import 'package:cars_store/core/utils/app_colors.dart';
import 'package:cars_store/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAuthTextFormField extends StatelessWidget {
  const CustomAuthTextFormField({
    super.key,
    required this.labelText,
    required this.icon,
    this.controller,
    required this.validator,
    this.textInputAction,
  });
  final String labelText;
  final String icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C323247),
            blurRadius: 8,
            offset: Offset(0, 3),
            spreadRadius: -1,
          ),
          BoxShadow(
            color: Color(0x3D0C1A4B),
            blurRadius: 1,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          prefixIcon: SvgPicture.asset(icon, fit: BoxFit.scaleDown),
          labelText: labelText,
          labelStyle: AppStyles.textFieldStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
