import 'categories.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../data/model/categories_model.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/functions/translate_data_base.dart';

class CustomCategoriesListView extends GetView<HomeControllerImp> {
  const CustomCategoriesListView({required this.categories, super.key});

  final List<CategoriesModel> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder:
          (context, index) => Categories(
            categoryName: translateDataBase(
              categories[index].categoriesName,
              categories[index].categoriesNameAr,
            ),
            categoryImage: categories[index].categoriesImage,
            onTap:
                () async => await controller.goToCategoryItems(
                  categories,
                  index,
                  categories[index].categoriesId,
                ),
          ),
      separatorBuilder: (context, index) => const SizedBox(width: 10),
    );
  }
}
