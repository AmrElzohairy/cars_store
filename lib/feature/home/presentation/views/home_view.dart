import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/core/widgets/custom_refresh_indicator.dart';
import 'package:cars_store/feature/home/presentation/cubits/featured_cars_cubit/featured_cars_cubit.dart';
import 'package:cars_store/feature/home/presentation/cubits/recommended_cars_cubit/recommended_cars_cubit.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/featured_cars_bloc_builder.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/home_recommended_widget.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/home_search_field_and_filters.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/home_sliver_grid_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const routeName = '/home_view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    var featuredCarsCubit = context.read<FeaturedCarsCubit>();
    var recommendedCarsCubit = context.read<RecommendedCarsCubit>();
    featuredCarsCubit.getFeaturedCars();
    recommendedCarsCubit.getRecommendedCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: () async {
        context.read<FeaturedCarsCubit>().getFeaturedCars();
        context.read<RecommendedCarsCubit>().getRecommendedCars();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: VerticalSpace(height: 20)),
            const SliverToBoxAdapter(child: HomeSearchFieldAndFilters()),
            const SliverToBoxAdapter(child: VerticalSpace(height: 20)),
            const SliverToBoxAdapter(child: FeaturedCarsBlocBuilder()),
            const SliverToBoxAdapter(child: VerticalSpace(height: 20)),
            SliverToBoxAdapter(child: HomeRecommendedWidget(onTap: () {})),
            const SliverToBoxAdapter(child: VerticalSpace(height: 20)),
            const HomeSliverGridBlocBuilder(),
            const SliverToBoxAdapter(child: VerticalSpace(height: 100)),
          ],
        ),
      ),
    );
  }
}
