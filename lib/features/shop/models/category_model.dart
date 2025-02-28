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
    return CategoryModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['image'],
    );
  }
}
