import 'package:equatable/equatable.dart';

class ItemsModel extends Equatable {
  const ItemsModel({
    required this.itemsId,
    required this.itemsName,
    required this.itemsPrice,
    required this.itemsImage,
    required this.itemsNameAr,
    required this.itemsActive,
    required this.itemsQuantity,
    required this.itemsDiscount,
    required this.itemsCategory,
    required this.itemsDescription,
    required this.itemsDescriptionAr,
    required this.itemsCreationTime,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> jsonData) => ItemsModel(
    itemsId: jsonData["items_id"],
    itemsName: jsonData["items_name"],
    itemsPrice: jsonData["items_price"],
    itemsImage: jsonData["items_image"],
    itemsActive: jsonData["items_active"],
    itemsNameAr: jsonData["items_name_ar"],
    itemsQuantity: jsonData["items_quantity"],
    itemsDiscount: jsonData["items_discount"],
    itemsCategory: jsonData["items_category"],
    itemsDescription: jsonData["items_description"],
    itemsCreationTime: jsonData["items_creation_time"],
    itemsDescriptionAr: jsonData["items_description_ar"],
  );

  final String itemsImage;
  final String itemsCategory;
  final String itemsCreationTime;
  final int itemsId, itemsActive;
  final String itemsName, itemsNameAr;
  final String itemsDescription, itemsDescriptionAr;
  final double itemsQuantity, itemsPrice, itemsDiscount;

  @override
  List<Object?> get props => [
    itemsId,
    itemsName,
    itemsPrice,
    itemsImage,
    itemsActive,
    itemsNameAr,
    itemsQuantity,
    itemsDiscount,
    itemsCategory,
    itemsDescription,
    itemsCreationTime,
    itemsDescriptionAr,
  ];
}
