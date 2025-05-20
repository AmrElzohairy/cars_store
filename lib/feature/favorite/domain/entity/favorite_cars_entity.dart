import 'package:cars_store/feature/favorite/data/models/favorite_cars_model/favorite_cars_model.dart';

class FavoriteCarsEntity {
  final String id;
  final String name;
  final String imageUrl;
  final num price;

  FavoriteCarsEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  factory FavoriteCarsEntity.fromModel(FavoriteCarsModel model) {
    return FavoriteCarsEntity(
      id: model.carId ?? '',
      name: model.modelName ?? '',
      imageUrl: model.imageUrls?.first ?? '',
      price: model.price ?? 0,
    );
  }
}
