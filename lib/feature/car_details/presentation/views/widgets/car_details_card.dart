import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/feature/car_details/presentation/views/widgets/car_details_row.dart';
import 'package:flutter/material.dart';

class CarDetailsCard extends StatelessWidget {
  const CarDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            CarDetailsRow(category: "Brand", value: "Tesla"),
            VerticalSpace(height: 5),
            CarDetailsRow(category: "Model", value: "Tesla Model S"),
            VerticalSpace(height: 5),
            CarDetailsRow(category: "Price", value: "\$60,000"),
            VerticalSpace(height: 5),
            CarDetailsRow(category: "Year of production", value: "2022"),
          ],
        ),
      ),
    );
  }
}
