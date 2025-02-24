import 'package:ewa_store/utils/constants/api_constants.dart';

class PosterModel {
  final String id;
  final String title;
  final String image;

  PosterModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory PosterModel.fromJson(Map<String, dynamic> json) {
    String originalImageUrl = json['imageUrl'] ?? '';
    String newImageBaseUrl = '$tempURL/image/poster/';

    // Extract the filename from the original image URL if present
    String imageFilename = originalImageUrl.split('/').last;

    String updatedImageUrl = imageFilename.isNotEmpty
        ? '$newImageBaseUrl$imageFilename'
        : originalImageUrl;
    return PosterModel(
      id: json['_id'] ?? '',
      title: json['posterName'] ?? '',
      image: updatedImageUrl,
    );
  }
}
