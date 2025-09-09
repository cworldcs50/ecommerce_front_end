import 'package:get/get.dart';

// Future<void> getToken() async {
  //   await notificationPermissionRequest();
  //   String? myToken = await FirebaseMessaging.instance.getToken();
  //   log("$myToken");
  //   log("${Get.find<Services>().prefs.getInt("user_id")}");
  // }

  // Future<void> notificationPermissionRequest() async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;

  //   NotificationSettings settings = await messaging.requestPermission(
  //     alert: true,
  //     announcement: false,
  //     badge: true,
  //     carPlay: false,
  //     criticalAlert: false,
  //     provisional: false,
  //     sound: true,
  //   );

  //   log('User granted permission: ${settings.authorizationStatus}');
  // }
  // getToken();

abstract class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {}
