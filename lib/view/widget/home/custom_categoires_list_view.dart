import 'categories.dart';
import 'package:flutter/material.dart';
import '../../../data/model/categories_model.dart';

class CustomCategoriesListView extends StatelessWidget {
  const CustomCategoriesListView({required this.categories, super.key});

  final List<CategoriesModel> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      itemBuilder:
          (context, index) => const Categories(
            categoryName: "Laptop",
            categoryImage: "assets/images/laptop.jpg",
          ),
      separatorBuilder: (context, index) => const SizedBox(width: 10),
    );
  }
}
