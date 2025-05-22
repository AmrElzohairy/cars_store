import 'package:carousel_slider/carousel_slider.dart';
import 'package:cars_store/core/utils/app_styles.dart';
import 'package:cars_store/core/utils/media_query_size.dart';
import 'package:cars_store/feature/car_details/presentation/views/widgets/car_details_row.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/spacing_widgets.dart';

class CarDetailsSkeleton extends StatelessWidget {
  const CarDetailsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
      ),
      child: Column(
        children: [
          const VerticalSpace(height: 50),
          CarouselSlider.builder(
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              viewportFraction: 0.88,
              initialPage: 0,
            ),
            itemCount: 1,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: height(context) * 0.3,
                          width: double.infinity,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
          ),
          const VerticalSpace(height: 20),
          const Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CarDetailsRow(category: "Brand", value: "Loading..."),
                  VerticalSpace(height: 5),
                  CarDetailsRow(category: "Model", value: "Loading..."),
                  VerticalSpace(height: 5),
                  CarDetailsRow(category: "Price", value: "\$${"Loading..."}"),
                  VerticalSpace(height: 5),
                  CarDetailsRow(
                    category: "Year of production",
                    value: "Loading...",
                  ),
                ],
              ),
            ),
          ),
          const VerticalSpace(height: 5),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "dfngvjkdnfjkghjkdfhgjkdfjkgdjkfbgdjkfbjkdvk cvbndfjgudfhgdfkjbdkbvkdfjkbdfkbvdfbdfjkbvdjkfbjkdfbkdfbjkdbkdkbdkbkdbvkdbvjkbdkbdkvbkd" *
                  5,
              textAlign: TextAlign.start,
              style: AppStyles.font16RegularBlackWithOpacity(context),
            ),
          ),
        ],
      ),
    );
  }
}
