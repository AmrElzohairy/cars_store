import 'package:cars_store/core/utils/media_query_size.dart';
import 'package:cars_store/feature/home/domain/entity/home_featured_list_entity.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/featured_cars_list_item.dart';
import 'package:flutter/material.dart';

class FeaturedCarsListView extends StatelessWidget {
  const FeaturedCarsListView({super.key, required this.carEntity});
  final List<HomeFeaturedListEntity> carEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: carEntity.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FeaturedCarsListItem(carEntity: carEntity[index]),
          );
        },
      ),
    );
  }
}
