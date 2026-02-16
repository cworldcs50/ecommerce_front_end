import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  const OrderModel({
    required this.ordersId,
    required this.ordersPrice,
    required this.ordersStatus,
    required this.ordersUserId,
    required this.ordersAddressId,
    required this.ordersCreationTime,
    required this.ordersDeliveryType,
    required this.ordersPaymentMethod,
    required this.isOrdersApplyCoupon,
    required this.ordersDeliveryPrice,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    ordersAddressId: json["orders_address_id"],
    ordersId: (json["orders_id"] as num).toInt(),
    isOrdersApplyCoupon: json["is_orders_apply_coupon"],
    ordersStatus: (json["orders_status"] as num).toInt(),
    ordersPrice: (json["orders_price"] as num).toDouble(),
    ordersUserId: (json["orders_user_id"] as num).toInt(),
    ordersCreationTime: DateTime.parse(json["orders_creation_time"]),
    ordersDeliveryType: (json["orders_delivery_price"] as num).toInt(),
    ordersPaymentMethod: int.parse(json["orders_payment_method"]),
    ordersDeliveryPrice: (json["orders_delivery_price"] as num).toDouble(),
  );

  final int ordersDeliveryType;
  final int ordersPaymentMethod;
  final int isOrdersApplyCoupon;
  final DateTime ordersCreationTime;
  final double ordersPrice, ordersDeliveryPrice;
  final int ordersId, ordersAddressId, ordersUserId, ordersStatus;

  @override
  List<Object?> get props => [
    ordersId,
    ordersPrice,
    ordersStatus,
    ordersUserId,
    ordersAddressId,
    ordersCreationTime,
    ordersDeliveryType,
    ordersPaymentMethod,
    isOrdersApplyCoupon,
    ordersDeliveryPrice,
  ];
}
