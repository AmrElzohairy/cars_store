import 'package:equatable/equatable.dart';

class FavoriteCarsModel extends Equatable {
  final String? userId;
  final String? carId;
  final String? carBrand;
  final List<dynamic>? imageUrls;
  final String? modelName;
  final num? price;
  final String? description;
  final int? yearOfProduction;
  final bool? isFeatured;
  final bool? isRecommended;

  const FavoriteCarsModel({
    this.userId,
    this.carId,
    this.carBrand,
    this.imageUrls,
    this.modelName,
    this.price,
    this.description,
    this.yearOfProduction,
    this.isFeatured,
    this.isRecommended,
  });

  factory FavoriteCarsModel.fromJson(Map<String, dynamic> json) {
    return FavoriteCarsModel(
      userId: json['userId'] as String?,
      carId: json['carId'] as String?,
      carBrand: json['carBrand'] as String?,
      imageUrls: json['imageUrls'] as List<dynamic>?,
      modelName: json['modelName'] as String?,
      price: json['price'] as num?,
      description: json['description'] as String?,
      yearOfProduction: json['yearOfProduction'] as int?,
      isFeatured: json['isFeatured'] as bool?,
      isRecommended: json['isRecommended'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'carId': carId,
    'carBrand': carBrand,
    'imageUrls': imageUrls,
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
      userId,
      carId,
      carBrand,
      imageUrls,
      modelName,
      price,
      description,
      yearOfProduction,
      isFeatured,
      isRecommended,
    ];
  }
}
