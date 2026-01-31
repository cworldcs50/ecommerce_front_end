import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';

class CustomCouponCodeFormField extends StatelessWidget {
  const CustomCouponCodeFormField({
    required this.couponCodeController,

    super.key,
  });
  final TextEditingController couponCodeController;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: couponCodeController,
        // validator:
        //     (value) =>
        //         value == null || value.isEmpty ? "enter promo code" : null,
        decoration: InputDecoration(
          isDense: true,
          hintText: "116".tr,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.redAccent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 2,
              color: AppColor.primaryColorDark,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 9),
        ),
      ),
    );
  }
}
