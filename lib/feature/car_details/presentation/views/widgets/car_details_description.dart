
import 'package:cars_store/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CarDetailsDescription extends StatelessWidget {
  const CarDetailsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "This is a detailed description of the car. It includes all the features and specifications." *
          30,
      textAlign: TextAlign.justify,
      style: AppStyles.font16RegularBlackWithOpacity(context),
    );
  }
}
