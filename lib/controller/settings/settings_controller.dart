import 'package:get/get.dart';
import '../../core/services/services.dart';
import '../../core/constants/app_routes_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsController extends GetxController {
  Future<void> logout();
}

class SettingsControllerImp extends SettingsController {
  late final SharedPreferences appSharedPrefs;

  @override
  void onInit() {
    appSharedPrefs = Get.find<Services>().prefs;
    super.onInit();
  }

  @override
  Future<void> logout() async {
    await appSharedPrefs.setBool("isUserSignedIn", false);
    await Get.offAllNamed(AppRoutesNames.kLogin);
  }
}
