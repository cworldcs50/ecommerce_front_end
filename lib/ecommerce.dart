import 'app_binding.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'core/constants/app_routes_names.dart';
import 'core/localization/app_langs_translations.dart';
import 'core/localization/change_locale_controller.dart';

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangeLocaleController changeLocaleController =
        Get.put<ChangeLocaleController>(ChangeLocaleController());

    return SafeArea(
      child: GetMaterialApp(
        title: 'Ecommerce',
        getPages: appPages,
        initialBinding: AppBinding(),
        debugShowCheckedModeBanner: false,
        translations: AppLangsTranslations(),
        theme: changeLocaleController.appTheme,
        initialRoute: AppRoutesNames.kLanguage,
        locale: changeLocaleController.language,
      ),
    );
  }
}
