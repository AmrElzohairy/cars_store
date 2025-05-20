import 'package:cars_store/feature/favorite/domain/repo/favorite_repo.dart';
import 'package:cars_store/feature/favorite/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:cars_store/feature/favorite/presentation/views/favorite_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/service_locator.dart';

class FavoriteViewBlocProvider extends StatelessWidget {
  const FavoriteViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(getIt<FavoriteRepo>()),
      child: const FavoriteView(),
    );
  }
}
