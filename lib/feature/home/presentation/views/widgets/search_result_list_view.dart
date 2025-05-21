import 'package:cars_store/core/utils/media_query_size.dart';
import 'package:cars_store/core/widgets/custom_cached_network_image.dart';
import 'package:cars_store/feature/home/data/models/search_model/search_model.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.searchResults});
  final List<SearchModel> searchResults;
  @override
  Widget build(BuildContext context) {
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
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CustomCachedNetworkImage(
                imageUrl: car.imagesUrls!.first,
                width: width(context) * 0.2,
                height: height(context) * 0.1,
              ),
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
            },
          ),
        );
      },
    );
  }
}
