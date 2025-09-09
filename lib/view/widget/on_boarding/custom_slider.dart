import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../data/datasource/static/static.dart';
import '../../../controller/on_boarding_controller.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            onBoardingModels.length,
            (index) => AnimatedContainer(
              height: 6,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: AppColor.primaryColorDark,
                borderRadius: BorderRadius.circular(10),
              ),
              duration: const Duration(milliseconds: 900),
              width: controller.currentPageIndex == index ? 25 : 10,
            ),
          ),
        );
      },
    );
  }
}
