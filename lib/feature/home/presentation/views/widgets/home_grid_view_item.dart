import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/feature/car_details/presentation/views/car_details_view.dart';
import 'package:cars_store/feature/home/domain/entity/recommended_cars_entity.dart';
import 'package:cars_store/feature/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/favorite_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/media_query_size.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';

class HomeGridViewItem extends StatefulWidget {
  const HomeGridViewItem({super.key, required this.carsEntity});
  final RecommendedCarsEntity carsEntity;

  @override
  State<HomeGridViewItem> createState() => _HomeGridViewItemState();
}

class _HomeGridViewItemState extends State<HomeGridViewItem> {
  late bool isFavorite;

  @override
  void initState() {
    isFavorite = widget.carsEntity.isLiked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var favoriteCubit = context.read<FavoriteCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(CarDetailsView.routeName , extra: widget.carsEntity.id);
                },
                child: CustomCachedNetworkImage(
                  imageUrl: widget.carsEntity.images.first,
                  height: height(context) * 0.22,
                  width: width(context) * 0.83,
                ),
              ),
            ),
            Positioned(
              top: height(context) * 0.015,
              right: width(context) * 0.04,
              child: GestureDetector(
                onTap: () {
                  favoriteCubit.toggleFavorite(carId: widget.carsEntity.id);
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: FavoriteWidget(isFavorite: isFavorite),
              ),
            ),
          ],
        ),
        VerticalSpace(height: height(context) * 0.01),
        Text(
          widget.carsEntity.name,
          style: AppStyles.font15MediumBlack(context),
        ),
        Text(
          "Rs. ${widget.carsEntity.price}",
          style: AppStyles.font12MediumPrimaryBlackWithOpacity(context),
        ),
      ],
    );
  }
}
