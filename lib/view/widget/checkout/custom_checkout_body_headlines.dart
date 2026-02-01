import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';

class CustomCheckoutBodyHeadlines extends StatelessWidget {
  const CustomCheckoutBodyHeadlines({super.key, required this.headline});

  final String headline;

  @override
  Widget build(BuildContext context) {
    return Text(
      headline,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.primaryColorDark,
      ),
    );
  }
}
