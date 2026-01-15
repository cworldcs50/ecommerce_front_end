import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
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
                ListTile(
                  title: const Text("Disable Notifications"),
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                    activeColor: AppColor.primaryColorDark,
                    inactiveThumbColor: Colors.grey.shade600,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text("Address"),
                  trailing: const Icon(Icons.location_on_outlined),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text("About us"),
                  trailing: const Icon(Icons.help_outline_rounded),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text("Contact us"),
                  trailing: const Icon(Icons.phone_callback_outlined),
                ),
                ListTile(
                  onTap: () async => await controller.logout(),
                  title: const Text("Logout"),
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
