import 'package:cars_store/feature/home/presentation/views/widgets/home_grid_view_item.dart';
import 'package:flutter/material.dart';

class HomeSliverGridBuilder extends StatelessWidget {
  const HomeSliverGridBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 175 / 231,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => const HomeGridViewItem(),
    );
  }
}
