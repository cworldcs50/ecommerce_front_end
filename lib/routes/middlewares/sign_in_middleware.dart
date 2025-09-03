import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_routes_names.dart';
import '../../core/services/services.dart';

class SignInMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final bool isUserSignedIn =
        Get.find<Services>().prefs.getBool("isUserSignedIn") ?? false;

    if (isUserSignedIn) {
      return const RouteSettings(name: AppRoutesNames.kHome);
    }

    return null;
  }
}
