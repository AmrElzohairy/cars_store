import 'package:cars_store/feature/home/presentation/views/widgets/featured_cars_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedCarsListView extends StatelessWidget {
  const FeaturedCarsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
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
