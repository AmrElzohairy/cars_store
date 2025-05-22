import 'package:cars_store/core/utils/app_colors.dart';
import 'package:cars_store/core/utils/app_styles.dart';
import 'package:cars_store/core/utils/media_query_size.dart';
import 'package:cars_store/feature/car_details/presentation/views/car_details_view.dart';
import 'package:cars_store/feature/home/domain/entity/home_featured_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_cached_network_image.dart';

class FeaturedCarsListItem extends StatelessWidget {
  const FeaturedCarsListItem({super.key, required this.carEntity});
  final FeaturedCarsEntity carEntity;
  @override
  Widget build(BuildContext context) {
    return Banner(
      location: BannerLocation.topStart,
      color: AppColors.primaryColor,
      message: "Featured",
      textStyle: AppStyles.font16BoldWhite(context),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              context.pushNamed(CarDetailsView.routeName);
            },
            child: SizedBox(
              height: height(context) * 0.2,
              width: width(context) * 0.82,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CustomCachedNetworkImage(
                  imageUrl: carEntity.images.first,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            child: Text(
              carEntity.name,
              style: AppStyles.font15SemiBoldWhite(context),
            ),
          ),
        ],
      ),
    );
  }
}
