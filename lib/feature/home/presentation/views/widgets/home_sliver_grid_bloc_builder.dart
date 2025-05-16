import 'package:cars_store/feature/home/presentation/cubits/recommended_cars_cubit/recommended_cars_cubit.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/home_sliver_grid_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSliverGridBlocBuilder extends StatelessWidget {
  const HomeSliverGridBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedCarsCubit, RecommendedCarsState>(
      builder: (context, state) {
        if (state is RecommendedCarsLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is RecommendedCarsLoaded) {
          return HomeSliverGridBuilder(carsEntity: state.cars);
        } else if (state is RecommendedCarsError) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        }
        return const SliverToBoxAdapter(
          child: Center(child: Text('Something went wrong')),
        );
      },
    );
  }
}
