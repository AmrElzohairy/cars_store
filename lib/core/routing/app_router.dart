import 'package:cars_store/core/cache/cache_constants.dart';
import 'package:cars_store/core/cache/cache_helper.dart';
import 'package:cars_store/core/helpers/service_locator.dart';
import 'package:cars_store/feature/auth/domain/repo/auth_repo.dart';
import 'package:cars_store/feature/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:cars_store/feature/auth/presentation/views/login_view.dart';
import 'package:cars_store/feature/auth/presentation/views/sign_up_view.dart';
import 'package:cars_store/feature/home/presentation/views/home_view.dart';
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
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: HomeView.routeName,
        name: HomeView.routeName,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}

String isUserAuthenticated() {
  bool isLoggedIn =
      CacheHelper.getBool(key: CacheKeys.isAuthenticated) ?? false;
  if (isLoggedIn) {
    return HomeView.routeName;
  } else {
    return LoginView.routeName;
  }
}
