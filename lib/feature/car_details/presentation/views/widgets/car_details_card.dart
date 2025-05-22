import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/feature/car_details/domain/entity/car_details_entity.dart';
import 'package:cars_store/feature/car_details/presentation/views/widgets/car_details_row.dart';
import 'package:flutter/material.dart';

class CarDetailsCard extends StatelessWidget {
  const CarDetailsCard({super.key, required this.carDetailsEntity});
  final CarDetailsEntity carDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CarDetailsRow(category: "Brand", value: carDetailsEntity.brand),
            const VerticalSpace(height: 5),
            CarDetailsRow(category: "Model", value: carDetailsEntity.name),
            const VerticalSpace(height: 5),
            CarDetailsRow(
              category: "Price",
              value: "\$${carDetailsEntity.price}",
            ),
            const VerticalSpace(height: 5),
            CarDetailsRow(
              category: "Year of production",
              value: "${carDetailsEntity.year}",
            ),
          ],
        ),
      ),
    );
  }
}
