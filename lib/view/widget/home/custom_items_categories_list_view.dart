import 'package:get/get.dart';
import '../../../core/functions/translate_data_base.dart';
import 'custom_items_categories.dart';
import 'package:flutter/material.dart';
import '../../../controller/items/items_controller.dart';

class CustomItemsCategoriesListView extends GetView<ItemsControllerImp> {
  const CustomItemsCategoriesListView({
    super.key,
    required this.trueIndex,
    required this.categories,
  });

  final int trueIndex;
  final List categories;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder:
          (context, index) => ItemsCategories(
            currentIndex: index,
            trueIndex: trueIndex,
            categoryName: translateDataBase(
              categories[index].categoriesName,
              categories[index].categoriesNameAr,
            ),
            onTap:
                () async => await controller.changeCat(
                  index,
                  categories[index].categoriesId,
                ),
          ),
      separatorBuilder: (context, index) => const SizedBox(width: 30),
    );
  }
}
