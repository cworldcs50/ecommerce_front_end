import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_botton_app_bar_btn.dart';
import '../../../core/constants/app_color.dart';
import '../../../controller/home/home_controller.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key, required this.controller});

  final HomeControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColor.backgroundColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          ...List.generate(controller.pages.length + 1, (index) {
            if (index == 2) {
              return const Spacer();
            } else {
              int correctIdx = index > 2 ? index - 1 : index;
              return CustomBottomAppBarBtn(
                active: correctIdx == controller.currentIndex,
                icon: controller.bottomAppBarBtnsIcons[correctIdx],
                title: controller.bottomAppBarBtnsTitle[correctIdx].tr,
                onPressed: () => controller.changeToPage((correctIdx)),
              );
            }
          }),
        ],
      ),
    );
  }
}
