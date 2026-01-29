import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.hintText,
    required this.labelText,
    required this.icon,
    required this.validator,
    required this.controller,
    required this.keyboardType,
    this.obsecureText = false,
    super.key,
  });

  final IconData icon;
  final String hintText;
  final String labelText;
  final bool obsecureText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obsecureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Text(labelText),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
