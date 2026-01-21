import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';

class CustomAddToCartMaterialBtn extends StatelessWidget {
  const CustomAddToCartMaterialBtn({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppColor.primaryColorDark,
      child: Text(
        "107".tr,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
