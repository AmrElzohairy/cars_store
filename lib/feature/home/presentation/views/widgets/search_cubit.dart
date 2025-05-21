import 'package:cars_store/feature/home/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/search_result_list_view.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/search_result_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({
    super.key,
    required this.searchCubit,
    required this.query,
  });

  final SearchCubit searchCubit;
  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      bloc: searchCubit,
      builder: (context, state) {
        if (state is SearchLoading) {
          return const SearchResultSkeleton();
        } else if (state is SearchError) {
          return Center(
            child: Text("can't find any results with model $query"),
          );
        } else if (state is SearchSuccess) {
          return SearchResultListView(searchResults: state.searchResults);
        }
        return Center(child: Text("can't find any results with model $query"));
      },
    );
  }
}
