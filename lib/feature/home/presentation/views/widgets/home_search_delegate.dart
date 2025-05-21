import 'package:cars_store/feature/home/data/models/search_model/search_model.dart';
import 'package:cars_store/feature/home/presentation/cubits/search_cubit/search_cubit.dart';
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
      return _buildEmptySearchView();
    }

    searchCubit.searchCars(query);

    return BlocBuilder<SearchCubit, SearchState>(
      bloc: searchCubit,
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchError) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else if (state is SearchSuccess) {
          if (state.searchResults.isEmpty) {
            return Center(child: Text('No results found for "$query"'));
          }
          return _buildSearchResultsList(state.searchResults);
        }
        return _buildEmptySearchView();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _buildEmptySearchView();
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
          return _buildSearchResultsList(state.searchResults);
        }
        return _buildEmptySearchView();
      },
    );
  }

  Widget _buildSearchResultsList(List<SearchModel> searchResults) {
    return ListView.builder(
      itemCount: searchResults.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final car = searchResults[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            leading:
                car.imagesUrls != null && car.imagesUrls!.isNotEmpty
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        car.imagesUrls![0].toString(),
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => Container(
                              width: 80,
                              height: 80,
                              color: Colors.grey[300],
                              child: const Icon(
                                Icons.car_repair,
                                color: Colors.grey,
                              ),
                            ),
                      ),
                    )
                    : Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[300],
                      child: const Icon(Icons.car_repair, color: Colors.grey),
                    ),
            title: Text(
              '${car.carBrand ?? ''} ${car.modelName ?? ''}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (car.yearOfProduction != null)
                  Text('Year: ${car.yearOfProduction}'),
                if (car.price != null)
                  Text(
                    'Price: \$${car.price}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
              ],
            ),
            onTap: () {
              // Navigate to car details page
              // You can pass the car ID to the details page
              close(context, car.carId);
            },
          ),
        );
      },
    );
  }

  Widget _buildEmptySearchView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Search for cars by brand, model, or year',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
