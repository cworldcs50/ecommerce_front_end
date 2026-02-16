import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';

class CustomApplyCouponBtn extends StatelessWidget {
  const CustomApplyCouponBtn({
    super.key,
    required this.onPressed,
    required this.isActive,
  });

  final void Function() onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !isActive,
      child: MaterialButton(
        onPressed: onPressed,
        textColor: Colors.white,
        color:
            isActive ? AppColor.primaryColorDark : AppColor.primaryColorLight,
        padding: const EdgeInsets.symmetric(vertical: 11),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Text("117".tr),
      ),
    );
  }
}
