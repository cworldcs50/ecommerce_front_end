import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../core/services/services.dart';
import '../data/datasource/static/static.dart';
import '../core/constants/app_routes_names.dart';

abstract class OnBoardingController extends GetxController {
  void next();
  void onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPageIndex = 0;
  late final PageController pageController;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void next() {
    if (currentPageIndex == onBoardingModels.length - 1) {
      Get.offNamed(AppRoutesNames.kLogin);
      Get.find<Services>().prefs.setBool("visited", true);
    }
    pageController.animateToPage(
      currentPageIndex + 1,
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeInOut,
    );
    update();
  }

    @override
  void onPageChanged(int index) {
    currentPageIndex = index;
    update();
  }
}
