import 'package:cars_store/core/utils/app_styles.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/feature/car_details/presentation/views/widgets/car_details_carousel.dart';
import 'package:cars_store/feature/car_details/presentation/views/widgets/car_details_row.dart';
import 'package:flutter/material.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key});
  static const routeName = "/car_details_view";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: VerticalSpace(height: 50)),
            const SliverToBoxAdapter(child: CarDetailsCarousel()),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const VerticalSpace(height: 20),
                  const CarDetailsRow(
                    category: "Model",
                    value: "Tesla Model S",
                  ),
                  const VerticalSpace(height: 5),
                  const CarDetailsRow(category: "Price", value: "\$60,000"),
                  const VerticalSpace(height: 5),
                  const CarDetailsRow(
                    category: "Year of production",
                    value: "2022",
                  ),
                  const VerticalSpace(height: 5),
                  Text(
                    "This is a detailed description of the car. It includes all the features and specifications." *
                        30,
                    textAlign: TextAlign.justify,
                    style: AppStyles.font16RegularBlackWithOpacity(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
