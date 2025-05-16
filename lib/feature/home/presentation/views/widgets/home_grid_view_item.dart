import 'package:cars_store/core/utils/app_colors.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/feature/home/domain/entity/recommended_cars_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/media_query_size.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';

class HomeGridViewItem extends StatelessWidget {
  const HomeGridViewItem({super.key, required this.carsEntity});
  final RecommendedCarsEntity carsEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CustomCachedNetworkImage(
                imageUrl: carsEntity.images.first,
                height: height(context) * 0.22,
                width: width(context) * 0.83,
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
        Text(carsEntity.name, style: AppStyles.font15MediumBlack(context)),
        Text(
          "Rs. ${carsEntity.price}",
          style: AppStyles.font12MediumPrimaryBlackWithOpacity(context),
        ),
      ],
    );
  }
}
