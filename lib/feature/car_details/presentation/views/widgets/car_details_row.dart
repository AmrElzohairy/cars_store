import 'package:cars_store/core/utils/app_styles.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:flutter/material.dart';

class CarDetailsRow extends StatelessWidget {
  const CarDetailsRow({super.key, required this.category, required this.value});
  final String category;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$category :",
          style: AppStyles.font18MediumPrimaryWithOpacity(context),
        ),
        const HorizontalSpace(width: 10),
        Text(value, style: AppStyles.font20BoldBlack(context)),
      ],
    );
  }
}
