import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CustomCartTitle extends StatelessWidget {
  const CustomCartTitle({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_back)),
        Expanded(
          child: Text(
            "100".tr,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
