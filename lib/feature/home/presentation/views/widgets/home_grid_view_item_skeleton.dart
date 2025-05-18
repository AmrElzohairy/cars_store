import 'package:cars_store/core/utils/app_colors.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/media_query_size.dart';

class HomeGridViewItemSkeleton extends StatelessWidget {
  const HomeGridViewItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: height(context) * 0.22,
                  width: width(context) * 0.83,
                  color: AppColors.white,
                ),
              ),
              Positioned(
                top: height(context) * 0.015,
                right: width(context) * 0.04,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(Icons.favorite, size: 18),
                ),
              ),
            ],
          ),
          VerticalSpace(height: height(context) * 0.01),
          Text("Car Name Example", style: AppStyles.font15MediumBlack(context)),
          Text(
            "Rs. 100,000",
            style: AppStyles.font12MediumPrimaryBlackWithOpacity(context),
          ),
        ],
      ),
    );
  }
}