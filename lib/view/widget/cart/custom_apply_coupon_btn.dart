import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';

class CustomApplyCouponBtn extends StatelessWidget {
  const CustomApplyCouponBtn({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: Colors.white,
      color: AppColor.primaryColorDark,
      padding: const EdgeInsets.symmetric(vertical: 11),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Text("117".tr),
    );
  }
}
