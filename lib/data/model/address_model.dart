import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  const AddressModel({
    required this.name,
    required this.addressId,
    required this.addressLat,
    required this.addressLong,
    required this.addressCity,
    required this.addressStreet,
  });

  final String name;
  final String addressId;
  final String addressLat;
  final String addressCity;
  final String addressLong;
  final String addressStreet;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    name: json["name"],
    addressCity: json["address_city"],
    addressStreet: json["address_street"],
    addressId: json["address_id"].toString(),
    addressLat: json["address_lat"].toString(),
    addressLong: json["address_long"].toString(),
  );

  @override
  List<Object?> get props => [
    name,
    addressId,
    addressLat,
    addressCity,
    addressLong,
    addressStreet,
  ];
}
