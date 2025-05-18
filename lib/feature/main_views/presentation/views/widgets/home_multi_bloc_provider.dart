import 'package:cars_store/core/helpers/service_locator.dart';
import 'package:cars_store/feature/home/domain/repo/home_repo.dart';
import 'package:cars_store/feature/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:cars_store/feature/home/presentation/cubits/featured_cars_cubit/featured_cars_cubit.dart';
import 'package:cars_store/feature/home/presentation/cubits/recommended_cars_cubit/recommended_cars_cubit.dart';
import 'package:cars_store/feature/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeMultiBlocProvider extends StatelessWidget {
  const HomeMultiBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedCarsCubit(homeRepo: getIt<HomeRepo>()),
        ),
        BlocProvider(
          create:
              (context) => RecommendedCarsCubit(homeRepo: getIt<HomeRepo>()),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(homeRepo: getIt<HomeRepo>()),
        ),
      ],
      child: const HomeView(),
    );
  }
}
