import 'package:cars_store/feature/favorite/data/models/favorite_cars_model/favorite_cars_model.dart';

class FavoriteCarsEntity {
  final String id;
  final String name;
  final String brand;
  final String imageUrl;
  final num price;

  FavoriteCarsEntity({
    required this.id,
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.price,
  });

  factory FavoriteCarsEntity.fromModel(FavoriteCarsModel model) {
    return FavoriteCarsEntity(
      id: model.carId ?? '',
      name: model.modelName ?? '',
      brand: model.carBrand ?? '',
      imageUrl: model.imageUrls?[1] ?? '',
      price: model.price ?? 0,
    );
  }
}
