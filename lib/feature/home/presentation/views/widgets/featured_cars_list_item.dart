import 'package:cars_store/core/utils/app_colors.dart';
import 'package:cars_store/core/utils/app_styles.dart';
import 'package:cars_store/feature/home/domain/entity/home_featured_list_entity.dart';
import 'package:flutter/material.dart';

class FeaturedCarsListItem extends StatelessWidget {
  const FeaturedCarsListItem({super.key, required this.carEntity});
  final HomeFeaturedListEntity carEntity;
  @override
  Widget build(BuildContext context) {
    return Banner(
      location: BannerLocation.topStart,
      color: AppColors.primaryColor,
      message: "Featured",
      textStyle: AppStyles.font16BoldWhite(context),
      child: Stack(
        children: [
          SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(carEntity.images.first),
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
