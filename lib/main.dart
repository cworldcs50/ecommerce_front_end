import 'app_binding.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';
import 'core/services/services.dart';
import 'package:flutter/material.dart';
import 'core/constants/app_routes_names.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/localization/app_langs_translations.dart';
import 'core/localization/change_locale_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      initialRoute: AppRoutesNames.kLanguage,
      initialBinding: AppBinding(),
      getPages: appPages,
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      translations: AppLangsTranslations(),
      locale: changeLocaleController.language,
      theme: changeLocaleController.appTheme,
    );
  }
}
