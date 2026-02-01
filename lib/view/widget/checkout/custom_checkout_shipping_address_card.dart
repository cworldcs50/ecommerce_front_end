import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../data/model/address_model.dart';

class CustomCheckoutShippingAddressCard extends StatelessWidget {
  const CustomCheckoutShippingAddressCard({
    super.key,
    required this.onTap,
    required this.isChoosed,
    required this.addressModel,
  });

  final bool isChoosed;
  final void Function() onTap;
  final AddressModel addressModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(addressModel.name),
        subtitle: Text(
          "${addressModel.addressStreet}, ${addressModel.addressCity}",
        ),
        selected: isChoosed,
        textColor: Colors.black,
        selectedColor: Colors.white,
        selectedTileColor: AppColor.primaryColorDark,
        subtitleTextStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
