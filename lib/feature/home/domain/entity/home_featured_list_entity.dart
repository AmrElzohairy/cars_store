import 'package:cars_store/feature/home/data/models/featured_cars_model.dart';
import 'package:equatable/equatable.dart';

class HomeFeaturedListEntity extends Equatable {
  final String id;
  final String name;
  final List<String> images;

  const HomeFeaturedListEntity({
    required this.id,
    required this.name,
    required this.images,
  });

  @override
  List<Object?> get props => [id, name, images];

  factory HomeFeaturedListEntity.fromFeaturedCarsModel(
    FeaturedCarsModel model,
  ) {
    return HomeFeaturedListEntity(
      id: model.modelId!,
      name: model.modelName!,
      images: model.imagesUrls!,
    );
  }
}
