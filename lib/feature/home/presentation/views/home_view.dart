import 'package:cars_store/core/utils/app_colors.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/feature/home/presentation/cubits/featured_cars_cubit/featured_cars_cubit.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/featured_cars_bloc_builder.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/home_recommended_widget.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/home_search_field_and_filters.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/home_sliver_grid_builder.dart';
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
    featuredCarsCubit.getFeaturedCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Row(
          children: [
            Spacer(),
            HorizontalSpace(width: 10),
            Text('CarsStore', style: TextStyle(color: AppColors.primaryColor)),
            Spacer(flex: 2),
            Icon(Icons.notifications_none),
          ],
        ),
      ),
      body: Padding(
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
            const HomeSliverGridBuilder(),
          ],
        ),
      ),
    );
  }
}
