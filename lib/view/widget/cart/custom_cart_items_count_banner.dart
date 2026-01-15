import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';

class CustomCartItemsCountBanner extends StatelessWidget {
  const CustomCartItemsCountBanner({super.key, required this.count});

  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.primaryColorLight,
      ),
      child: Text(
        "You Have $count Items in your list",
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColor.primaryColorDark),
      ),
    );
  }
}
