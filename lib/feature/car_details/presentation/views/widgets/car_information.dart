import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/feature/car_details/presentation/views/widgets/car_details_card.dart';
import 'package:cars_store/feature/car_details/presentation/views/widgets/car_details_description.dart';
import 'package:flutter/material.dart';

class CarInformations extends StatelessWidget {
  const CarInformations({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        VerticalSpace(height: 20),
        CarDetailsCard(),
        VerticalSpace(height: 5),
        CarDetailsDescription(),
      ],
    );
  }
}
