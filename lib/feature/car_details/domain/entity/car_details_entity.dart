import 'package:cars_store/feature/car_details/data/models/car_details_model.dart';

class CarDetailsEntity {
  final String id;
  final String name;
  final String brand;
  final int year;
  final num price;
  final List<dynamic> images;
  final String description;

  CarDetailsEntity({
    required this.id,
    required this.name,
    required this.brand,
    required this.year,
    required this.price,
    required this.images,
    this.description = "",
  });

  factory CarDetailsEntity.fromModel(CarDetailsModel carModel) {
    return CarDetailsEntity(
      id: carModel.carId ?? "",
      name: carModel.modelName ?? "",
      brand: carModel.carBrand ?? "",
      year: carModel.yearOfProduction ?? 0,
      price: carModel.price ?? 0,
      images: carModel.imagesUrls ?? [],
      description: carModel.description ?? "",
    );
  }
}
