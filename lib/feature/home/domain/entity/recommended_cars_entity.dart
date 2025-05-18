import 'package:cars_store/feature/home/data/models/recommended_cars_model/recommended_cars_model.dart';
import 'package:equatable/equatable.dart';

class RecommendedCarsEntity extends Equatable {
  final String id;
  final String name;
  final List<dynamic> images;
  final String description;
  final num price;
  final bool isLiked;

  const RecommendedCarsEntity({
    required this.id,
    required this.name,
    required this.images,
    required this.description,
    required this.price,
    this.isLiked = false,
  });

  @override
  List<Object?> get props => [id, name, images, description, price];

  factory RecommendedCarsEntity.fromRecommendedCarsModel(
    RecommendedCarsModel model,
  ) {
    return RecommendedCarsEntity(
      id: model.carId ?? '',
      name: model.modelName ?? '',
      images: model.imagesUrls ?? [],
      description: model.description ?? '',
      price: model.price ?? 0,
      isLiked: model.isLiked ?? false,
    );
  }
}
