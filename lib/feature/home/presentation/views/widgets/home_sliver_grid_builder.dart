import 'package:cars_store/feature/home/domain/entity/recommended_cars_entity.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/home_grid_view_item.dart';
import 'package:flutter/material.dart';

class HomeSliverGridBuilder extends StatelessWidget {
  const HomeSliverGridBuilder({super.key, required this.carsEntity});
  final List<RecommendedCarsEntity> carsEntity;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 175 / 231,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: carsEntity.length,
      itemBuilder:
          (context, index) => HomeGridViewItem(carsEntity: carsEntity[index]),
    );
  }
}
