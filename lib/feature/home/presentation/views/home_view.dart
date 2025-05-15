import 'package:cars_store/core/utils/app_colors.dart';
import 'package:cars_store/core/utils/assets.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/core/widgets/custom_search_field.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/featured_cars_list_view.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/home_grid_view_item.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/home_recommended_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/home_view';
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
            SliverToBoxAdapter(
              child: Row(
                children: [
                  const CustomSearchField(),
                  const HorizontalSpace(width: 10),
                  SvgPicture.asset(Assets.imagesFilterIcon),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: VerticalSpace(height: 20)),
            const SliverToBoxAdapter(child: FeaturedCarsListView()),
            const SliverToBoxAdapter(child: VerticalSpace(height: 20)),
            SliverToBoxAdapter(child: HomeRecommendedWidget(onTap: () {})),
            const SliverToBoxAdapter(child: VerticalSpace(height: 20)),
            const SliverToBoxAdapter(child: HomeGridViewItem()),
          ],
        ),
      ),
    );
  }
}
