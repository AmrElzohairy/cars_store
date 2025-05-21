import 'package:cars_store/feature/home/data/models/search_model/search_model.dart';
import 'package:cars_store/feature/home/domain/repo/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.homeRepo}) : super(SearchInitial());
  final HomeRepo homeRepo;

  Future<void> searchCars(String query) async {
    emit(SearchLoading());
    final result = await homeRepo.searchCars(query: query);
    result.fold(
      (failure) => emit(SearchError(failure.errMessage)),
      (searchResults) => emit(SearchSuccess(searchResults)),
    );
  }
}
