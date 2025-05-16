import 'package:cars_store/core/utils/media_query_size.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/featured_cars_list_item.dart';
import 'package:flutter/material.dart';

class FeaturedCarsListView extends StatelessWidget {
  const FeaturedCarsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 8),
            child: FeaturedCarsListItem(),
          );
        },
      ),
    );
  }
}
