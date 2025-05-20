import 'package:cars_store/core/utils/app_colors.dart';
import 'package:cars_store/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/media_query_size.dart';

class FeaturedCarsListItemSkeleton extends StatelessWidget {
  const FeaturedCarsListItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
      ),
      child: SizedBox(
        height: height(context) * 0.2,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder:
              (context, index) => Banner(
                location: BannerLocation.topStart,
                color: AppColors.primaryColor,
                message: "Featured",
                textStyle: AppStyles.font16BoldWhite(context),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 180, // Adjust height as needed for your design
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        // Using a Container as a placeholder for the image
                        child: Container(color: Colors.grey.shade300),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 20,
                      child: Text(
                        "Car Name Placeholder", // Placeholder text
                        style: AppStyles.font15SemiBoldWhite(context),
                      ),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
