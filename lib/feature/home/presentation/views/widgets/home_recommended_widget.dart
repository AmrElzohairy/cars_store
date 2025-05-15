import 'package:cars_store/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeRecommendedWidget extends StatelessWidget {
  const HomeRecommendedWidget({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Recommended", style: AppStyles.font20MediumBlack(context)),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: Text("See All", style: AppStyles.font16MediumPrimary(context)),
        ),
      ],
    );
  }
}
