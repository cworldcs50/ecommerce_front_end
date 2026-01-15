import 'custom_offer_container.dart';
import 'package:flutter/material.dart';

class CustomOfferListView extends StatelessWidget {
  const CustomOfferListView({required this.offerContainers, super.key});

  final List<CustomOfferContainer> offerContainers;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: offerContainers.length,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(width: 20),
      itemBuilder: (context, index) => offerContainers[index],
    );
  }
}
