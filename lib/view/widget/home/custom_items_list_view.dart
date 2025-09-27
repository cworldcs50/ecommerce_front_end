import 'custom_item.dart';
import 'package:flutter/material.dart';
import '../../../data/model/items_model.dart';

class CustomItemsListView extends StatelessWidget {
  const CustomItemsListView({required this.items, super.key});

  final List<ItemsModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(width: 20),
      itemBuilder:
          (context, index) => CustomItem(
            imagePath: items[index].itemsImage,
            title: items[index].itemsName,
          ),
    );
  }
}
