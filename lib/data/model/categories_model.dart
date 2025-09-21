import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
  const CategoriesModel({
    required this.categoriesId,
    required this.categoriesImage,
    required this.categoriesName,
    required this.categoriesNameAr,
    required this.categoriesCreationTime,
  });

  final int categoriesId;
  final String categoriesName, categoriesNameAr;
  final String categoriesImage;
  final String categoriesCreationTime;

  @override
  List<Object?> get props => [
    categoriesId,
    categoriesName,
    categoriesNameAr,
    categoriesImage,
    categoriesCreationTime,
  ];
}
