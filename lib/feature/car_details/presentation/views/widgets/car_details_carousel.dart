import 'package:carousel_slider/carousel_slider.dart';
import 'package:cars_store/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CarDetailsCarousel extends StatelessWidget {
  const CarDetailsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 0.9,
        initialPage: 0,
      ),
      itemCount: 3,
      itemBuilder:
          (BuildContext context, int itemIndex, int pageViewIndex) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Image.asset(Assets.imagesTeslaCarTest),
          ),
    );
  }
}
