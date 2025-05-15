
import 'package:cars_store/core/utils/app_colors.dart';
import 'package:cars_store/core/utils/assets.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class HomeGridViewItem extends StatelessWidget {
  const HomeGridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(Assets.imagesAudiCarTest, height: height * 0.27),
            Positioned(
              top: height * 0.015,
              right: width * 0.04,
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Audi autron Premium",
              style: AppStyles.font15MediumBlack(context),
            ),
            Text(
              "Rs. 1,00,000",
              style: AppStyles.font12MediumPrimaryBlackWithOpacity(context),
            ),
          ],
        ),
      ],
    );
  }
}
