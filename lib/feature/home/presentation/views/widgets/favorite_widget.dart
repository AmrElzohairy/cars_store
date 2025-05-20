import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key, required this.isFavorite});

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(
        Icons.favorite,
        size: 18,
        color:
            isFavorite
                ? AppColors.primaryColor
                : AppColors.black.withValues(alpha: 0.6),
      ),
    );
  }
}
