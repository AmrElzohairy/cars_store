import 'package:cars_store/core/helpers/service_locator.dart';
import 'package:cars_store/core/utils/app_colors.dart';
import 'package:cars_store/core/utils/media_query_size.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/feature/favorite/domain/repo/favorite_repo.dart';
import 'package:cars_store/feature/favorite/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:cars_store/feature/favorite/presentation/views/favorite_view.dart';
import 'package:cars_store/feature/main_views/presentation/views/widgets/home_multi_bloc_provider.dart';
import 'package:cars_store/feature/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViews extends StatefulWidget {
  const MainViews({super.key});
  static const routeName = '/main_view';
  @override
  State<MainViews> createState() => _MainViewsState();
}

class _MainViewsState extends State<MainViews> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: AppColors.white,
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
      body: IndexedStack(
        index: currentIndex,
        children: [
          const HomeMultiBlocProvider(),
          BlocProvider(
            create:
                (context) =>
                    FavoriteCubit(getIt<FavoriteRepo>())..getFavoriteCars(),
            child: const FavoriteView(),
          ),
          const ProfileView(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          height: height(context) * 0.08,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.white,
              selectedItemColor: AppColors.primaryColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 28,
              elevation: 0,
              unselectedItemColor: AppColors.cadetGray,
              selectedIconTheme: const IconThemeData(size: 28),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 30),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
