import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../controller/on_boarding_controller.dart';

class CustomButton extends GetView<OnBoardingControllerImp> {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 60),
      child: MaterialButton(
        onPressed: () => controller.next(),
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 2),
        color: AppColor.primaryColorDark,
        child: Text(
          "10".tr,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
