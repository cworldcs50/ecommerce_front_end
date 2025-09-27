import 'package:flutter/material.dart';

class CustomSearchFormField extends StatelessWidget {
  const CustomSearchFormField({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        hintText: title,
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
