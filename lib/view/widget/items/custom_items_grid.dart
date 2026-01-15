import 'package:get/get.dart';
import 'custom_item_card.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/data/model/items_model.dart';
import '../../../controller/items/items_controller.dart';

class CustomItemsGrid extends GetView<ItemsControllerImp> {
  const CustomItemsGrid({required this.items, super.key});

  final List<ItemsModel> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.5,
      ),
      itemBuilder:
          (context, index) => CustomItemCard(
            itemModel: items[index],
            onTap: () async => await controller.itemDetails(items[index]),
          ),
    );
  }
}
