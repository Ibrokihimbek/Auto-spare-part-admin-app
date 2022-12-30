class CategoryModel {
  String categoryId;
  String categoryName;
  String description;
  String imageUrl;
  String createdAt;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      categoryId: jsonData['categoryId'] as String? ?? '',
      categoryName: jsonData['categoryName'] as String? ?? '',
      description: jsonData['description'] as String? ?? '',
      imageUrl: jsonData['imageUrl'] as String? ?? '',
      createdAt: jsonData['createdAt'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'categoryName': categoryName,
      'description': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }

  @override
  String toString() {
    return ''''
       categoryId : $categoryId,
       categoryName : $categoryName,
       description : $description,
       imageUrl : $imageUrl,
       createdAt : $createdAt, 
      ''';
  }

  CategoryModel copyWith({
    String? categoryId,
    String? categoryName,
    String? description,
    String? imageUrl,
    String? createdAt,
  }) =>
      CategoryModel(
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        createdAt: createdAt ?? this.createdAt,
      );
}
