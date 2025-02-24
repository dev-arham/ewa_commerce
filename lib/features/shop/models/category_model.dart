import 'package:ewa_store/utils/constants/api_constants.dart';

class CategoryModel {
  final String id;
  final String name;
  final String imageUrl;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  static CategoryModel empty() => CategoryModel(
        id: '',
        name: '',
        imageUrl: '',
      );

  // Factory constructor to create a Category from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    String originalImageUrl = json['image'] ?? '';
    String newImageBaseUrl = '$tempURL/image/category/';

    // Extract the filename from the original image URL if present
    String imageFilename = originalImageUrl.split('/').last;

    String updatedImageUrl = imageFilename.isNotEmpty
        ? '$newImageBaseUrl$imageFilename'
        : originalImageUrl;
    return CategoryModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: updatedImageUrl,
    );
  }
}
