class FeaturedCarsModel {
  String? modelId;
  String? carBrand;
  List<String>? imagesUrls;
  String? modelName;
  int? price;
  dynamic description;
  int? yearOfProduction;
  bool? isFeatured;
  bool? isRecommended;

  FeaturedCarsModel({
    this.modelId,
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
      modelId: json['modelId'] as String?,
      carBrand: json['carBrand'] as String?,
      imagesUrls: json['imagesUrls'] as List<String>?,
      modelName: json['modelName'] as String?,
      price: json['price'] as int?,
      description: json['description'] as dynamic,
      yearOfProduction: json['yearOfProduction'] as int?,
      isFeatured: json['isFeatured'] as bool?,
      isRecommended: json['isRecommended'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'modelId': modelId,
    'carBrand': carBrand,
    'imagesUrls': imagesUrls,
    'modelName': modelName,
    'price': price,
    'description': description,
    'yearOfProduction': yearOfProduction,
    'isFeatured': isFeatured,
    'isRecommended': isRecommended,
  };
}
