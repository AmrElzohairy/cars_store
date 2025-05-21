import 'package:cars_store/core/widgets/custom_error_widget.dart';
import 'package:cars_store/feature/favorite/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:cars_store/feature/favorite/presentation/views/widgets/favorite_item_list_view.dart';
import 'package:cars_store/feature/favorite/presentation/views/widgets/favorite_item_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteListBlocBuilder extends StatelessWidget {
  const FavoriteListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const FavoriteItemSkeleton();
        } else if (state is FavoriteError) {
          return CustomErrorWidget(
            onRetry: () {
              context.read<FavoriteCubit>().getFavoriteCars();
            },
            message: state.error,
          );
        } else if (state is FavoriteSuccess) {
          return FavoriteItemListView(carsEntity: state.favoriteCars);
        }
        return const Center(child: Text('No favorite cars found.'));
      },
    );
  }
}
