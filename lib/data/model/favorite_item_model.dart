import 'package:equatable/equatable.dart';
import 'items_model.dart';
import '../../core/constants/app_api_links.dart';

class FavoriteItemModel extends Equatable {
  const FavoriteItemModel({
    required this.itemsImage,
    required this.itemsName,
    required this.itemsNameAr,
    required this.categoriesName,
    required this.itemsPriceAfterDiscount,
    required this.categoriesNameAr,
    required this.itemsDescription,
    required this.itemsDescriptionAr,
    required this.itemsQuantity,
    required this.itemsPrice,
    required this.itemsDiscount,
    required this.itemsCreationTime,
    required this.categoriesCreationTime,
    required this.itemsId,
    required this.itemsActive,
    required this.categoriesId,
    required this.itemsCategory,
  });

  factory FavoriteItemModel.fromJson(Map<String, dynamic> jsonData) =>
      FavoriteItemModel(
        itemsId: jsonData["items_id"],
        itemsName: jsonData["items_name"],
        itemsPriceAfterDiscount:
            double.parse(jsonData["items_price"].toString()) -
            (double.parse(jsonData["items_discount"].toString()) /
                100 *
                double.parse(jsonData["items_price"].toString())),
        itemsActive: jsonData["items_active"],
        itemsNameAr: jsonData["items_name_ar"],
        categoriesId: jsonData["categories_id"],
        itemsCategory: jsonData["items_category"],
        categoriesName: jsonData["categories_name"],
        itemsDescription: jsonData["items_description"],
        categoriesNameAr: jsonData["categories_name_ar"],
        itemsCreationTime: jsonData["items_creation_time"],
        itemsDescriptionAr: jsonData["items_description_ar"],
        categoriesCreationTime: jsonData["categories_creation_time"],
        itemsPrice: double.parse(jsonData["items_price"].toString()),
        itemsQuantity: double.parse(jsonData["items_quantity"].toString()),
        itemsDiscount: double.parse(jsonData["items_discount"].toString()),
        itemsImage: "${AppApiLinks.kItemsImages}/${jsonData["items_image"]}",
      );

  ItemsModel fromFavoriteToItem() => ItemsModel(
    itemsPriceAfterDiscount: itemsPriceAfterDiscount,
    itemsId: itemsId,
    itemsName: itemsName,
    itemsPrice: itemsPrice,
    itemsImage: itemsImage,
    isFavorite: true,
    itemsNameAr: itemsNameAr,
    itemsActive: itemsActive,
    categoriesId: categoriesId,
    itemsQuantity: itemsQuantity,
    itemsDiscount: itemsDiscount,
    itemsCategory: itemsCategory,
    categoriesName: categoriesName,
    categoriesNameAr: categoriesNameAr,
    itemsDescription: itemsDescription,
    itemsCreationTime: itemsCreationTime,
    itemsDescriptionAr: itemsDescriptionAr,
    categoriesCreationTime: categoriesCreationTime,
  );

  final String itemsImage;
  final String itemsName, itemsNameAr;
  final String categoriesName, categoriesNameAr;
  final String itemsDescription, itemsDescriptionAr;
  final double itemsQuantity,
      itemsPrice,
      itemsDiscount,
      itemsPriceAfterDiscount;
  final String itemsCreationTime, categoriesCreationTime;
  final int itemsId, itemsActive, categoriesId, itemsCategory;

  @override
  List<Object?> get props => [
    itemsImage,
    itemsName,
    itemsNameAr,
    categoriesName,
    itemsPriceAfterDiscount,
    categoriesNameAr,
    itemsDescription,
    itemsDescriptionAr,
    itemsQuantity,
    itemsPrice,
    itemsDiscount,
    itemsCreationTime,
    categoriesCreationTime,
    itemsId,
    itemsActive,
    categoriesId,
    itemsCategory,
  ];
}
