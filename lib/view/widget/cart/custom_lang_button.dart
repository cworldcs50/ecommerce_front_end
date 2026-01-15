import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_color.dart';

class CustomPlaceOrder extends StatelessWidget {
  const CustomPlaceOrder({
    required this.btnTitle,
    required this.onPressed,
    super.key,
  });

  final String btnTitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColor.primaryColorDark,
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(horizontal: Get.width / 3),
      textColor: Colors.white,
      child: Text(
        btnTitle,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
      ),
    );
  }
}
