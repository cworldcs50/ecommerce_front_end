import 'package:flutter/material.dart';

class CustomSearchFormField extends StatelessWidget {
  const CustomSearchFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        hintText: "Find Product",
        fillColor: Colors.grey[200],
        hintStyle: const TextStyle(fontSize: 20),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: const Icon(size: 30, Icons.search),
      ),
    );
  }
}
