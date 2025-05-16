import 'package:cars_store/feature/home/presentation/cubits/featured_cars_cubit/featured_cars_cubit.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/featured_cars_list_item_skeleton.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/featured_cars_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedCarsBlocBuilder extends StatelessWidget {
  const FeaturedCarsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedCarsCubit, FeaturedCarsState>(
      builder: (context, state) {
        if (state is FeaturedCarsLoading) {
          return const FeaturedCarsListItemSkeleton();
        } else if (state is FeaturedCarsLoaded) {
          return FeaturedCarsListView(carEntity: state.cars);
        } else if (state is FeaturedCarsError) {
          return Center(child: Text(state.errMessage));
        }
        return const Center(child: Text("Something went wrong........"));
      },
    );
  }
}
