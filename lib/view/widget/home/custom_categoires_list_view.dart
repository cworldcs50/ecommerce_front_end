import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../data/model/categories_model.dart';

class CustomCategoriesListView extends StatelessWidget {
  const CustomCategoriesListView({required this.categories, super.key});

  final List<CategoriesModel> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SvgPicture.network(categories[index].categoriesImage),
            ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
