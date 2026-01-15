import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_routes_names.dart';
import '../../widget/language/custom_lang_button.dart';
import '../../../core/localization/change_locale_controller.dart';

class Language extends GetView<ChangeLocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(fontSize: 25),
            ),
            const SizedBox(height: 15),
            CustomLangButton(
              btnTitle: "2".tr,
              onPressed: () async {
                await controller.changeLang("ar");
                await Get.toNamed(AppRoutesNames.kOnBoarding);
              },
            ),
            CustomLangButton(
              btnTitle: "3".tr,
              onPressed: () async {
                await controller.changeLang("en");
                await Get.toNamed(AppRoutesNames.kOnBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
