import 'package:flutter/material.dart';
import '../../../data/model/address_model.dart';

class CustomCheckoutShippingAddressCardsListView extends StatelessWidget {
  const CustomCheckoutShippingAddressCardsListView({
    super.key,
    required this.addresses,
    required this.itemBuilder,
  });

  final List<AddressModel> addresses;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: addresses.length,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: itemBuilder,
    );
  }
}
