import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/feature/car_details/domain/entity/car_details_entity.dart';
import 'package:cars_store/feature/car_details/presentation/views/widgets/car_details_card.dart';
import 'package:cars_store/feature/car_details/presentation/views/widgets/car_details_description.dart';
import 'package:flutter/material.dart';

class CarInformations extends StatelessWidget {
  const CarInformations({super.key, required this.carDetailsEntity});
  final CarDetailsEntity carDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(height: 20),
        CarDetailsCard(carDetailsEntity: carDetailsEntity),
        const VerticalSpace(height: 5),
        CarDetailsDescription(carDetailsEntity: carDetailsEntity),
      ],
    );
  }
}
