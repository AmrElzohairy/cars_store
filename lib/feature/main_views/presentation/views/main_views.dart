import 'package:cars_store/feature/home/domain/repo/home_repo.dart';
import 'package:cars_store/feature/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:cars_store/feature/home/presentation/cubits/featured_cars_cubit/featured_cars_cubit.dart';
import 'package:cars_store/feature/home/presentation/cubits/recommended_cars_cubit/recommended_cars_cubit.dart';
import 'package:cars_store/feature/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/service_locator.dart';

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
      body: IndexedStack(
        index: currentIndex,
        children: [
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create:
                    (context) => FeaturedCarsCubit(homeRepo: getIt<HomeRepo>()),
              ),
              BlocProvider(
                create:
                    (context) =>
                        RecommendedCarsCubit(homeRepo: getIt<HomeRepo>()),
              ),
              BlocProvider(
                create: (context) => FavoriteCubit(homeRepo: getIt<HomeRepo>()),
              ),
            ],
            child: const HomeView(),
          ),
          const Center(child: Text('fAvorite')),
          const Center(child: Text('Profile')),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
