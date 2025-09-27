import 'package:equatable/equatable.dart';
import '../../core/constants/app_api_links.dart';

class ItemsModel extends Equatable {
  const ItemsModel({
    required this.itemsId,
    required this.itemsName,
    required this.itemsPrice,
    required this.itemsImage,
    required this.itemsNameAr,
    required this.itemsActive,
    required this.categoriesId,
    required this.itemsQuantity,
    required this.itemsDiscount,
    required this.itemsCategory,
    required this.categoriesName,
    required this.categoriesNameAr,
    required this.itemsDescription,
    required this.itemsCreationTime,
    required this.itemsDescriptionAr,
    required this.categoriesCreationTime,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> jsonData) => ItemsModel(
    itemsId: jsonData["items_id"],
    itemsName: jsonData["items_name"],
    itemsPrice: double.parse(jsonData["items_price"].toString()),
    itemsImage: "${AppApiLinks.kItemsImages}/${jsonData["items_image"]}",
    itemsActive: jsonData["items_active"],
    itemsNameAr: jsonData["items_name_ar"],
    categoriesId: jsonData["categories_id"],
    itemsQuantity: double.parse(jsonData["items_quantity"].toString()),
    itemsDiscount: double.parse(jsonData["items_discount"].toString()),
    itemsCategory: jsonData["items_category"],
    categoriesName: jsonData["categories_name"],
    itemsDescription: jsonData["items_description"],
    categoriesNameAr: jsonData["categories_name_ar"],
    itemsCreationTime: jsonData["items_creation_time"],
    itemsDescriptionAr: jsonData["items_description_ar"],
    categoriesCreationTime: jsonData["categories_creation_time"],
  );

  final String itemsName, itemsNameAr;
  final String itemsImage;
  final int itemsId, itemsActive, categoriesId, itemsCategory;
  final String categoriesName, categoriesNameAr;
  final String itemsDescription, itemsDescriptionAr;
  final double itemsQuantity, itemsPrice, itemsDiscount;
  final String itemsCreationTime, categoriesCreationTime;

  @override
  List<Object?> get props => [
    itemsId,
    itemsName,
    itemsImage,
    itemsPrice,
    itemsNameAr,
    itemsActive,
    categoriesId,
    itemsQuantity,
    itemsDiscount,
    itemsCategory,
    categoriesName,
    itemsDescription,
    categoriesNameAr,
    itemsCreationTime,
    itemsDescriptionAr,
    categoriesCreationTime,
  ];
}
