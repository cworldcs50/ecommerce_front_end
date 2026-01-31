import 'package:equatable/equatable.dart';

class CouponModel extends Equatable {
  const CouponModel({
    required this.couponId,
    required this.couponName,
    required this.couponCount,
    required this.couponDiscount,
    required this.couponExpirationDate,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
    couponName: json["coupon_name"],
    couponId: json["coupon_id"],
    couponCount: json["coupon_count"],
    couponDiscount: json["coupon_discount"] / 100.0,
    couponExpirationDate: DateTime.parse(json["coupon_expiration_date"]),
  );

  final int couponId;
  final int couponCount;
  final String couponName;
  final double couponDiscount;
  final DateTime couponExpirationDate;

  @override
  List<Object?> get props => [
    couponId,
    couponName,
    couponCount,
    couponDiscount,
    couponExpirationDate,
  ];
}
