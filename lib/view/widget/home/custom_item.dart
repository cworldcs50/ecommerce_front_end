import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({required this.imagePath, required this.title, super.key});

  final String imagePath, title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
            height: 160,
            width: 240,
          ),
        ),
        Container(
          height: 160,
          width: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black.withValues(alpha: 0.4),
          ),
        ),
        Positioned(
          top: 10,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
