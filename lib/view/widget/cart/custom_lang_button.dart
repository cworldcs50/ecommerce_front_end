import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_color.dart';

class CustomPlaceOrder extends StatelessWidget {
  const CustomPlaceOrder({
    required this.btnTitle,
    required this.onPressed,
    required this.isActive,
    super.key,
  });

  final bool isActive;
  final String btnTitle;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !isActive,
      child: MaterialButton(
        color:
            isActive ? AppColor.primaryColorDark : AppColor.primaryColorLight,
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(horizontal: Get.width / 3),
        textColor: Colors.white,
        child: Text(
          btnTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
      ),
    );
  }
}
