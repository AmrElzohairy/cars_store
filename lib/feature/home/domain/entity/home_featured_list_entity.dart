import 'package:cars_store/feature/home/data/models/featured_cars_model/featured_cars_model.dart';
import 'package:equatable/equatable.dart';

class FeaturedCarsEntity extends Equatable {
  final String id;
  final String name;
  final List<dynamic> images;

  const FeaturedCarsEntity({
    required this.id,
    required this.name,
    required this.images,
  });

  @override
  List<Object?> get props => [id, name, images];

  factory FeaturedCarsEntity.fromFeaturedCarsModel(FeaturedCarsModel model) {
    return FeaturedCarsEntity(
      id: model.carId ?? '',
      name: model.modelName ?? '',
      images: model.imagesUrls ?? [],
    );
  }
}
