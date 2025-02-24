import 'package:ewa_store/utils/constants/api_constants.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final int price;
  final int quantity;
  final int offerPrice;
  final Category proCategory;
  final SubCategory proSubCategory;
  final Brand proBrand;
  final List<ProductImage> images;
  final List<ProductVariant>? productVariants;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.quantity,
    required this.price,
    required this.offerPrice,
    required this.proCategory,
    required this.proSubCategory,
    required this.proBrand,
    required this.images,
    this.productVariants,
    required this.createdAt,
    required this.updatedAt,
  });

  int get totalQuantity {
    return quantity;
  }

  String get productDiscountPercentage {
    return "${((price - offerPrice) / price * 100).round()}%";
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      quantity: json['quantity'],
      price: (json['price'] as num).toInt(),
      offerPrice: (json['offerPrice'] as num).toInt(),
      proCategory: Category.fromJson(json['proCategory']),
      proSubCategory: SubCategory.fromJson(json['proSubCategory']),
      proBrand: Brand.fromJson(json['proBrand']),
      images: (json['images'] as List<dynamic>)
          .map((image) => ProductImage.fromJson(image))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
    );
  }
}

class SubCategory {
  final String id;
  final String name;

  SubCategory({required this.id, required this.name});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['_id'],
      name: json['name'],
    );
  }
}

class Brand {
  final String id;
  final String name;

  Brand({required this.id, required this.name});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'],
      name: json['name'],
    );
  }
}

class ProductImage {
  final String id;
  final String image;
  final String url;

  ProductImage({required this.id, required this.image, required this.url});

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    String originalImageUrl = json['url'] ?? '';
    String newImageBaseUrl = '$tempURL/image/products/';

    // Extract the filename from the original image URL if present
    String imageFilename = originalImageUrl.split('/').last;

    String updatedImageUrl = imageFilename.isNotEmpty
        ? '$newImageBaseUrl$imageFilename'
        : originalImageUrl;
    return ProductImage(
      id: json['_id'],
      image: json['image'],
      url: updatedImageUrl,
    );
  }
}

class ProductVariant {
  final String variantType;
  final List<Variant> variants;

  ProductVariant({required this.variantType, required this.variants});

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      variantType: json['variantType'],
      variants: (json['variants'] as List<dynamic>)
          .map((variant) => Variant.fromJson(variant))
          .toList(),
    );
  }
}

class Variant {
  final String variantName;
  final int quantity;
  final String id;

  Variant(
      {required this.variantName, required this.quantity, required this.id});

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      variantName: json['variantName'],
      quantity: json['quantity'],
      id: json['_id'],
    );
  }
}
