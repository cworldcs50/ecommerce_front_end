// import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({
    required this.categoryImage,
    required this.categoryName,
    super.key,
  });

  final String categoryImage;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Image.asset(categoryImage),
          // child: SvgPicture.network(categoryImage),
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
