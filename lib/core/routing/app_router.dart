import 'package:cars_store/core/cache/cache_constants.dart';
import 'package:cars_store/core/cache/cache_helper.dart';
import 'package:cars_store/core/helpers/service_locator.dart';
import 'package:cars_store/feature/auth/domain/repo/auth_repo.dart';
import 'package:cars_store/feature/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:cars_store/feature/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:cars_store/feature/auth/presentation/views/login_view.dart';
import 'package:cars_store/feature/auth/presentation/views/sign_up_view.dart';
import 'package:cars_store/feature/car_details/domain/repo/car_details_repo.dart';
import 'package:cars_store/feature/car_details/presentation/cubits/car_details_cubit/car_details_cubit.dart';
import 'package:cars_store/feature/car_details/presentation/views/car_details_view.dart';
import 'package:cars_store/feature/home/domain/repo/home_repo.dart';
import 'package:cars_store/feature/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:cars_store/feature/home/presentation/cubits/featured_cars_cubit/featured_cars_cubit.dart';
import 'package:cars_store/feature/home/presentation/cubits/recommended_cars_cubit/recommended_cars_cubit.dart';
import 'package:cars_store/feature/home/presentation/views/home_view.dart';
import 'package:cars_store/feature/main_views/presentation/views/main_views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: isUserAuthenticated(),
    routes: [
      GoRoute(
        path: LoginView.routeName,
        name: LoginView.routeName,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SignInCubit(authRepo: getIt<AuthRepo>()),
              child: const LoginView(),
            ),
      ),
      GoRoute(
        path: SignUpView.routeName,
        name: SignUpView.routeName,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SignUpCubit(authRepo: getIt<AuthRepo>()),
              child: const SignUpView(),
            ),
      ),
      GoRoute(
        path: HomeView.routeName,
        name: HomeView.routeName,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create:
                      (context) =>
                          FeaturedCarsCubit(homeRepo: getIt<HomeRepo>()),
                ),
                BlocProvider(
                  create:
                      (context) =>
                          RecommendedCarsCubit(homeRepo: getIt<HomeRepo>()),
                ),
                BlocProvider(
                  create:
                      (context) => FavoriteCubit(homeRepo: getIt<HomeRepo>()),
                ),
              ],
              child: const HomeView(),
            ),
      ),
      GoRoute(
        path: MainViews.routeName,
        name: MainViews.routeName,
        builder: (context, state) => const MainViews(),
      ),
      GoRoute(
        path: CarDetailsView.routeName,
        name: CarDetailsView.routeName,
        builder:
            (context, state) => BlocProvider(
              create: (context) => CarDetailsCubit(getIt<CarDetailsRepo>()),
              child: CarDetailsView(carId: state.extra as String),
            ),
      ),
    ],
  );
}

String isUserAuthenticated() {
  bool isLoggedIn =
      CacheHelper.getBool(key: CacheKeys.isAuthenticated) ?? false;
  if (isLoggedIn) {
    return MainViews.routeName;
  } else {
    return LoginView.routeName;
  }
}
