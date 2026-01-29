import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../core/services/services.dart';
import 'package:geolocator/geolocator.dart';
import '../data/datasource/static/static.dart';
import '../core/constants/app_routes_names.dart';

abstract class OnBoardingController extends GetxController {
  void next();
  void onPageChanged(int index);
  Future<void> positionPermission();
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPageIndex = 0;
  late final PageController pageController;

  @override
  Future<void> positionPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.showSnackbar(GetSnackBar(title: '${"110".tr}.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.showSnackbar(GetSnackBar(title: "111".tr));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.showSnackbar(GetSnackBar(title: "112".tr));
    }
  }

  @override
  Future<void> onInit() async {
    pageController = PageController();
    await positionPermission();
    super.onInit();
  }

  @override
  void next() {
    if (currentPageIndex == onBoardingModels.length - 1) {
      Get.offAllNamed(AppRoutesNames.kLogin);
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
