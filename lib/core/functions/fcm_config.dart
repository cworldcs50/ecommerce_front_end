import 'dart:developer';
import 'package:get/get.dart';
import '../../controller/checkout/orders_archieve_controller.dart';
import '../../controller/notifications/notifications_controller.dart';
import '../constants/app_routes_names.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

void fcmMessaging() {
  FirebaseMessaging.onMessage.listen((remoteMessage) async {
    log("======================= Notification =======================");
    log(
      " ======================= Title: ${remoteMessage.notification!.title!} =======================",
    );
    log(
      " ======================= body: ${remoteMessage.notification!.body!} =======================",
    );

    log(Get.currentRoute);

    await FlutterRingtonePlayer().playNotification();

    Get.snackbar(
      remoteMessage.notification!.title!,
      remoteMessage.notification!.body!,
    );

    if (remoteMessage.data["pageId"] == "order" &&
        Get.currentRoute == AppRoutesNames.kOrdersArchieve) {
      await Get.find<OrdersArchieveController>().getOrdersArchieve();
    }
    if (Get.currentRoute == AppRoutesNames.kNotification) {
      await Get.find<NotificationsController>().getNotifications();
    }
  });
}
