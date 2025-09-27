import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.categoryImage,
    required this.categoryName,
  });

  final String categoryName, categoryImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Container(
          width: 90,
          height: 80,
          decoration: BoxDecoration(
            color: AppColor.primaryColorDark,
            borderRadius: BorderRadius.circular(20),
          ),
          child: CachedNetworkImage(
            width: 50,
            height: 50,
            imageUrl: categoryImage,
            errorWidget:
                (context, url, error) => const Icon(Icons.error, size: 50),
            placeholder: (context, url) => const CircularProgressIndicator(),
          ),
        ),

        Text(
          categoryName,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
