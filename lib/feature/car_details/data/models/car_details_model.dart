import 'package:equatable/equatable.dart';

class CarDetailsModel extends Equatable {
  final String? carId;
  final String? carBrand;
  final List<String>? imagesUrls;
  final bool? isLiked;
  final String? modelName;
  final int? price;
  final String? description;
  final int? yearOfProduction;
  final bool? isFeatured;
  final bool? isRecommended;

  const CarDetailsModel({
    this.carId,
    this.carBrand,
    this.imagesUrls,
    this.isLiked,
    this.modelName,
    this.price,
    this.description,
    this.yearOfProduction,
    this.isFeatured,
    this.isRecommended,
  });

  factory CarDetailsModel.fromJson(Map<String, dynamic> json) {
    return CarDetailsModel(
      carId: json['carId'] as String?,
      carBrand: json['carBrand'] as String?,
      imagesUrls: json['imagesUrls'] as List<String>?,
      isLiked: json['isLiked'] as bool?,
      modelName: json['modelName'] as String?,
      price: json['price'] as int?,
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
    'isLiked': isLiked,
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
      isLiked,
      modelName,
      price,
      description,
      yearOfProduction,
      isFeatured,
      isRecommended,
    ];
  }
}
