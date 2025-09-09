import 'app_binding.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';
import 'core/services/services.dart';
import 'package:flutter/material.dart';
import 'core/constants/app_routes_names.dart';
import 'core/localization/app_langs_translations.dart';
import 'core/localization/change_locale_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangeLocaleController changeLocaleController =
        Get.put<ChangeLocaleController>(ChangeLocaleController());

    return GetMaterialApp(
      title: 'Ecommerce',
      getPages: appPages,
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      translations: AppLangsTranslations(),
      initialRoute: AppRoutesNames.kLanguage,
      locale: changeLocaleController.language,
      theme: changeLocaleController.appTheme,
    );
  }
}
