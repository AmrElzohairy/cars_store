import 'package:cars_store/core/utils/app_colors.dart';
import 'package:cars_store/core/utils/app_styles.dart';
import 'package:cars_store/core/utils/assets.dart';
import 'package:flutter/material.dart';

class FeaturedCarsListItem extends StatelessWidget {
  const FeaturedCarsListItem({super.key});

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
              child: Image.asset(Assets.imagesTeslaCarTest),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            child: Text(
              "Tesla model 3 standard range plus",
              style: AppStyles.font15SemiBoldWhite(context),
            ),
          ),
        ],
      ),
    );
  }
}
