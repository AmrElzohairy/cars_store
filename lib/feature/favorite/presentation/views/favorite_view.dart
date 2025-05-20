import 'package:cars_store/feature/favorite/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:cars_store/feature/favorite/presentation/views/widgets/favorite_list_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    context.read<FavoriteCubit>().getFavoriteCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const FavoriteListBlocBuilder();
  }
}
