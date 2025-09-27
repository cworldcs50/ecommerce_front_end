import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
          child: CachedNetworkImage(
            width: 240,
            height: 160,
            imageUrl: imagePath,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeholder: (context, url) => const CircularProgressIndicator(),
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
