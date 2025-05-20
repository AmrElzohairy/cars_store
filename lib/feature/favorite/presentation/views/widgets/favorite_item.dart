import 'package:cars_store/core/utils/app_styles.dart';
import 'package:cars_store/core/utils/media_query_size.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/core/widgets/custom_cached_network_image.dart';
import 'package:cars_store/feature/favorite/domain/entity/favorite_cars_entity.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.carsEntity});
  final FavoriteCarsEntity carsEntity;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CustomCachedNetworkImage(
                imageUrl: carsEntity.imageUrl,
                height: height(context) * 0.2,
                width: width(context) * 0.4,
              ),
            ),
            const HorizontalSpace(width: 15),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  carsEntity.name,
                  style: AppStyles.font16MediumBlack(context),
                ),
                Text(
                  carsEntity.brand,
                  style: AppStyles.font16MediumBlack(context),
                ),
                Text(
                  "Price: \$${carsEntity.price}",
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
