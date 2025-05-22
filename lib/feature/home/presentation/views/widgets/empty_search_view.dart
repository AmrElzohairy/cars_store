import 'package:cars_store/core/utils/app_colors.dart';
import 'package:cars_store/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EmptySearchView extends StatelessWidget {
  const EmptySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search, size: 55, color: AppColors.cadetGray),
          const SizedBox(height: 16),
          Text(
            'Search for cars by brand, model, or year',
            style: AppStyles.font18MediumPrimaryWithOpacity(context),
          ),
        ],
      ),
    );
  }
}
