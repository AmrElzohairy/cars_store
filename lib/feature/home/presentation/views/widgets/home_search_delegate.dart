import 'package:cars_store/feature/home/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/empty_search_view.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/search_result_list_view.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/search_result_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    return BlocBuilder<SearchCubit, SearchState>(
      bloc: searchCubit,
      builder: (context, state) {
        if (state is SearchLoading) {
          return const SearchResultSkeleton();
        } else if (state is SearchError) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else if (state is SearchSuccess) {
          if (state.searchResults.isEmpty) {
            return Center(child: Text('No results found for "$query"'));
          }
          return SearchResultListView(searchResults: state.searchResults);
        }
        return const EmptySearchView();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const EmptySearchView();
    }

    // Perform search as user types
    searchCubit.searchCars(query);

    return BlocBuilder<SearchCubit, SearchState>(
      bloc: searchCubit,
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccess) {
          if (state.searchResults.isEmpty) {
            return Center(child: Text('No results found for "$query"'));
          }
          return SearchResultListView(searchResults: state.searchResults);
        }
        return const EmptySearchView();
      },
    );
  }
}
