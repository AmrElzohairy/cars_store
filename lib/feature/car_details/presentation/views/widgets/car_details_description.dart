import 'package:cars_store/core/utils/app_styles.dart';
import 'package:cars_store/feature/car_details/domain/entity/car_details_entity.dart';
import 'package:flutter/material.dart';

class CarDetailsDescription extends StatelessWidget {
  const CarDetailsDescription({super.key, required this.carDetailsEntity});
  final CarDetailsEntity carDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        carDetailsEntity.description * 5,
        textAlign: TextAlign.start,
        style: AppStyles.font16RegularBlackWithOpacity(context),
      ),
    );
  }
}
