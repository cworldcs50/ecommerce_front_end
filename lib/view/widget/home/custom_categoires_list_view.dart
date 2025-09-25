import 'categories.dart';
import 'package:flutter/material.dart';
import '../../../data/model/categories_model.dart';

class CustomCategoriesListView extends StatelessWidget {
  const CustomCategoriesListView({required this.categories, super.key});

  final List<CategoriesModel> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder:
          (context, index) => const Categories(
            categoryName: "Laptop",
            categoryImage: "assets/images/laptop.svg",
          ),
      separatorBuilder: (context, index) => const SizedBox(width: 10),
    );
  }
}
