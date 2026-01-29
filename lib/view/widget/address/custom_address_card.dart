import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../data/model/address_model.dart';

class CustomAddressCard extends StatelessWidget {
  const CustomAddressCard({
    required this.addressModel,
    required this.delete,
    super.key,
  });

  final AddressModel addressModel;
  final void Function() delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        trailing: IconButton(
          onPressed: delete,
          icon: const Icon(
            Icons.delete_outline,
            color: AppColor.primaryColorDark,
          ),
        ),
        title: Text(addressModel.name),
        subtitle: Text(
          "${addressModel.addressCity}, ${addressModel.addressStreet}",
        ),
      ),
    );
  }
}
