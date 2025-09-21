import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
  const CategoriesModel({
    required this.categoriesId,
    required this.categoriesImage,
    required this.categoriesName,
    required this.categoriesNameAr,
    required this.categoriesCreationTime,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> jsonData) =>
      CategoriesModel(
        categoriesId: jsonData["categories_id"],
        categoriesImage: jsonData["categories_image"],
        categoriesName: jsonData["categories_name"],
        categoriesNameAr: jsonData["categories_name_ar"],
        categoriesCreationTime: jsonData["categories_creation_time"],
      );

  final int categoriesId;
  final String categoriesImage;
  final String categoriesCreationTime;
  final String categoriesName, categoriesNameAr;

  @override
  List<Object?> get props => [
    categoriesId,
    categoriesName,
    categoriesNameAr,
    categoriesImage,
    categoriesCreationTime,
  ];
}
