import 'package:equatable/equatable.dart';

class CartModel extends Equatable {
  final int cartItemId;
  final int itemsActive;
  final String itemsName;
  final int itemsCategory;
  final int itemsDiscount;
  final int itemsQuantity;
  final double itemsPrice;
  final String itemsImage;
  final String itemsNameAr;
  final String itemsDescription;
  final String itemsCreationTime;
  final String itemsDescriptionAr;
  final int noItem, cartId, userId, itemsId;
  final double itemTotalPrice, itemTotalPriceAfterDiscount;

  const CartModel({
    required this.cartId,
    required this.userId,
    required this.noItem,
    required this.itemsId,
    required this.itemsName,
    required this.cartItemId,
    required this.itemsPrice,
    required this.itemsImage,
    required this.itemsNameAr,
    required this.itemsActive,
    required this.itemsDiscount,
    required this.itemsQuantity,
    required this.itemsCategory,
    required this.itemTotalPrice,
    required this.itemsDescription,
    required this.itemsCreationTime,
    required this.itemsDescriptionAr,
    required this.itemTotalPriceAfterDiscount,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      noItem: json['no_item'],
      cartId: json['cart_id'],
      userId: json['user_id'],
      itemsId: json['items_id'],
      itemsName: json['items_name'],
      itemsImage: json['items_image'],
      cartItemId: json['cart_item_id'],
      itemsActive: json['items_active'],
      itemsNameAr: json['items_name_ar'],
      itemsDiscount: json['items_discount'],
      itemsQuantity: json['items_quantity'],
      itemsCategory: json['items_category'],
      itemsDescription: json['items_description'],
      itemsCreationTime: json['items_creation_time'],
      itemsDescriptionAr: json['items_description_ar'],
      itemsPrice: (json['items_price'] as num).toDouble(),
      itemTotalPriceAfterDiscount:
          (json['item_total_price'] as num).toDouble() -
          ((json['item_total_price'] as num).toDouble() *
              (json['items_discount'] as num).toDouble()),
      itemTotalPrice: (json['item_total_price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'no_item': noItem,
      'cart_id': cartId,
      'user_id': userId,
      'items_id': itemsId,
      'items_name': itemsName,
      'items_price': itemsPrice,
      'items_image': itemsImage,
      'cart_item_id': cartItemId,
      'items_active': itemsActive,
      'items_name_ar': itemsNameAr,
      'items_discount': itemsDiscount,
      'items_category': itemsCategory,
      'items_quantity': itemsQuantity,
      'item_total_price': itemTotalPrice,
      'items_description': itemsDescription,
      'items_creation_time': itemsCreationTime,
      'items_description_ar': itemsDescriptionAr,
    };
  }

  @override
  List<Object?> get props => [
    noItem,
    cartId,
    userId,
    itemsId,
    itemsName,
    itemsImage,
    itemsPrice,
    cartItemId,
    itemsNameAr,
    itemsActive,
    itemsDiscount,
    itemsCategory,
    itemsQuantity,
    itemTotalPrice,
    itemsDescription,
    itemsCreationTime,
    itemsDescriptionAr,
  ];
}

/**
 * "CountAndPriceData":{"total_price":1220,"total_count":2}
 */

/**
 * "item_total_price":1200,
 * "no_item":4,"items_id":5,
 * "items_name":"mobile s22 ultra",
 * "items_name_ar":"اس 22 الترا سامسونغ",
 * "items_description":"Samsung s22 ultra Ram 12 Hard 512 GB Camera 100 Megabyte",
 * "items_description_ar":"اس 22 الترا سامسونغ رام 12 هارد 512 كاميرا 100 ميغابايت",
 * "items_image":"samsung.png",
 * "items_active":1,
 * "items_price":300,
 * "items_discount":0,
 * "items_category":2,
 * "items_creation_time":"2025-09-25 16:08:38",
 * "items_quantity":22,
 * "cart_id":11,
 * "user_id":23,
 * "cart_item_id":5
 */
