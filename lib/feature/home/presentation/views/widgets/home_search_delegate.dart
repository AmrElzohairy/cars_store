import 'package:cars_store/feature/home/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/empty_search_view.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/search_cubit.dart';
import 'package:flutter/material.dart';

class HomeSearchDelegate extends SearchDelegate {
  final SearchCubit searchCubit;

  HomeSearchDelegate({required this.searchCubit});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          searchCubit.searchCars('');
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const EmptySearchView();
    }

    searchCubit.searchCars(query);

    return SearchBlocBuilder(searchCubit: searchCubit, query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const EmptySearchView();
    }

    // Perform search as user types
    searchCubit.searchCars(query);

    return SearchBlocBuilder(searchCubit: searchCubit, query: query);
  }
}
