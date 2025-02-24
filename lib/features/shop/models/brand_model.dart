class BrandModel {
  final String id;
  final String name;
  final String subCategoryId;
  final String subCategoryName;
  final String parentCategoryId;

  BrandModel({
    required this.id,
    required this.name,
    required this.subCategoryId,
    required this.subCategoryName,
    required this.parentCategoryId,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      subCategoryId: json['subcategoryId']['_id'] ?? '',
      subCategoryName: json['subcategoryId']['name'] ?? '',
      parentCategoryId: json['subcategoryId']['categoryId'] ?? '',
    );
  }
}
