import 'package:carousel_slider/carousel_slider.dart';
import 'package:cars_store/core/widgets/custom_cached_network_image.dart';
import 'package:cars_store/feature/car_details/domain/entity/car_details_entity.dart';
import 'package:flutter/material.dart';

class CarDetailsCarousel extends StatelessWidget {
  const CarDetailsCarousel({super.key, required this.carDetailsEntity});
  final CarDetailsEntity carDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 0.88,
        initialPage: 0,
      ),
      itemCount: carDetailsEntity.images.length,
      itemBuilder:
          (BuildContext context, int itemIndex, int pageViewIndex) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CustomCachedNetworkImage(
                imageUrl: carDetailsEntity.images[itemIndex],
              ),
            ),
          ),
    );
  }
}
