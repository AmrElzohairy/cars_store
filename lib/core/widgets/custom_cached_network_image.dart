
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      errorWidget:
          (context, url, error) => const Icon(Icons.hide_image_outlined),
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}
