import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_routes_names.dart';
import '../../core/localization/change_locale_controller.dart';

class LanguageMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (Get.find<ChangeLocaleController>().services.prefs.getString(
          "language",
        ) !=
        null) {
      return const RouteSettings(name: AppRoutesNames.kOnBoarding);
    }
    return null;
  }
}
