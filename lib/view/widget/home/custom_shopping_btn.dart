import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';

class CustomShoppingBasketBtn extends StatelessWidget {
  const CustomShoppingBasketBtn({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      backgroundColor: AppColor.primaryColorDark,
      child: const Icon(
        Icons.shopping_cart_outlined,
        color: AppColor.backgroundColor,
      ),
    );
  }
}
