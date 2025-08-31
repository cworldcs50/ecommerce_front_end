import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends GetxService {
  late final SharedPreferences prefs;

  Future<Services> init() async {
    prefs = await SharedPreferences.getInstance();

    return this;
  }
}

Future<void> initialServices() async {
  await Get.putAsync(() => Services().init());
}
