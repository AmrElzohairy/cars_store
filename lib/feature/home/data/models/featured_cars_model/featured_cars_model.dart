import 'package:equatable/equatable.dart';

class FeaturedCarsModel extends Equatable {
  final String? carId;
  final String? carBrand;
  final List<dynamic>?
  imagesUrls; // Changed from List<String>? to List<dynamic>?
  final String? modelName;
  final num? price; // Changed from int? to num? to handle potential doubles
  final String? description;
  final int? yearOfProduction;
  final bool? isFeatured;
  final bool? isRecommended;

  const FeaturedCarsModel({
    this.carId,
    this.carBrand,
    this.imagesUrls,
    this.modelName,
    this.price,
    this.description,
    this.yearOfProduction,
    this.isFeatured,
    this.isRecommended,
  });

  factory FeaturedCarsModel.fromJson(Map<String, dynamic> json) {
    return FeaturedCarsModel(
      carId: json['carId'] as String?,
      carBrand: json['carBrand'] as String?,
      imagesUrls:
          json['imagesUrls']
              as List<dynamic>?, // Changed from List<String>? to List<dynamic>?
      modelName: json['modelName'] as String?,
      price:
          json['price']
              as num?, // Changed from int? to num? to handle potential doubles
      description: json['description'] as String?,
      yearOfProduction: json['yearOfProduction'] as int?,
      isFeatured: json['isFeatured'] as bool?,
      isRecommended: json['isRecommended'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'carId': carId,
    'carBrand': carBrand,
    'imagesUrls': imagesUrls,
    'modelName': modelName,
    'price': price,
    'description': description,
    'yearOfProduction': yearOfProduction,
    'isFeatured': isFeatured,
    'isRecommended': isRecommended,
  };

  @override
  List<Object?> get props {
    return [
      carId,
      carBrand,
      imagesUrls,
      modelName,
      price,
      description,
      yearOfProduction,
      isFeatured,
      isRecommended,
    ];
  }
}
