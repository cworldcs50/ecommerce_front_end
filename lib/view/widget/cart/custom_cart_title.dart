import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CustomCartTitle extends StatelessWidget {
  const CustomCartTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
        const Expanded(
          child: Text(
            "My Cart",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
