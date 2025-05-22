import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/feature/car_details/presentation/views/widgets/car_details_carousel.dart';
import 'package:flutter/material.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key});
  static const routeName = "/car_details_view";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: VerticalSpace(height: 50)),
            SliverToBoxAdapter(child: CarDetailsCarousel()),
          ],
        ),
      ),
    );
  }
}
