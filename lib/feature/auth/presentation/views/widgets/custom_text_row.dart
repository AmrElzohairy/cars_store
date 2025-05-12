import 'package:cars_store/core/utils/app_styles.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:flutter/material.dart';

class CustomTextRow extends StatelessWidget {
  const CustomTextRow({
    super.key,
    required this.askText,
    required this.inkWellText,
    this.onTap,
  });
  final String askText;
  final String inkWellText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(askText, style: AppStyles.font14MediumPrimaryWithOpacity),
        const HorizontalSpace(width: 5),
        InkWell(
          onTap: onTap,
          child: Text(
            inkWellText,
            style: AppStyles.font14MediumPrimaryPrimaryColor,
          ),
        ),
      ],
    );
  }
}
