import 'package:cars_store/core/utils/app_styles.dart';
import 'package:cars_store/core/utils/assets.dart';
import 'package:cars_store/core/utils/media_query_size.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                Assets.imagesAudiCarTest,
                height: height(context) * 0.2,
                width: width(context) * 0.4,
              ),
            ),
            const HorizontalSpace(width: 15),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Audi A4", style: AppStyles.font16MediumBlack(context)),
                Text("Brand", style: AppStyles.font16MediumBlack(context)),
                Text(
                  "Price: \$30,000",
                  style: AppStyles.font16MediumBlack(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
