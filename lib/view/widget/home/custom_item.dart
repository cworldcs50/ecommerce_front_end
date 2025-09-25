import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/images/laptop.jpg",
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
        const Positioned(
          top: 10,
          child: Text(
            "Laptop Surface Go 2",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
