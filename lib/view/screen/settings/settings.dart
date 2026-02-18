import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_routes_names.dart';
import '../../widget/settings/custom_settings_title.dart';
import '../../../controller/settings/settings_controller.dart';

class Settings extends GetView<SettingsControllerImp> {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: ListView(
        children: [
          const CustomSettingsTitle(),
          const SizedBox(height: 100),
          Card(
            elevation: 20,
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              children: [
                GetBuilder<SettingsControllerImp>(
                  builder: (ctrl) {
                    return ListTile(
                      title: Text("95".tr),
                      trailing: Switch(
                        onChanged: ctrl.notificationController,
                        value: ctrl.notificationControllerValue,
                        activeColor: AppColor.primaryColorDark,
                        inactiveThumbColor: Colors.grey.shade600,
                      ),
                    );
                  },
                ),
                ListTile(
                  onTap:
                      () async =>
                          await Get.toNamed(AppRoutesNames.kAddressView),
                  title: Text("96".tr),
                  trailing: const Icon(Icons.location_on_outlined),
                ),
                ListTile(
                  onTap:
                      () async =>
                          await Get.toNamed(AppRoutesNames.kOrdersArchieve),
                  title: const Text("orders archieve"),
                  trailing: const Icon(Icons.shopping_cart_outlined),
                ),
                ListTile(
                  onTap: () {},
                  title: Text("97".tr),
                  trailing: const Icon(Icons.help_outline_rounded),
                ),
                ListTile(
                  onTap: () {},
                  title: Text("98".tr),
                  trailing: const Icon(Icons.phone_callback_outlined),
                ),
                ListTile(
                  onTap: () async => await controller.logout(),
                  title: Text("99".tr),
                  trailing: const Icon(Icons.logout_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
