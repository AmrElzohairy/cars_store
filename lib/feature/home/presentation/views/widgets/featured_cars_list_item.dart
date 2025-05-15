import 'package:cars_store/core/utils/app_styles.dart';
import 'package:cars_store/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FeaturedCarsListItem extends StatelessWidget {
  const FeaturedCarsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            style: AppStyles.font15SemiBoldWhite,
          ),
        ),
        Positioned(
          top: -18,
          left: -18,
          child: SvgPicture.asset(Assets.imagesFeaturedBadge),
        ),
      ],
    );
  }
}
