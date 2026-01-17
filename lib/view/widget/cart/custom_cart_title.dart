import 'package:flutter/material.dart';

class CustomCartTitle extends StatelessWidget {
  const CustomCartTitle({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
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
