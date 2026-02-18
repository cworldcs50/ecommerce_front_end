import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';
import '../widgets/custom_notification_list_view.dart';
import '../../../../core/class/request_handler_view.dart';
import '../../../../controller/notifications/notifications_controller.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.primaryColorDark,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "119".tr,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColorDark,
          ),
        ),
      ),
      body: GetBuilder<NotificationsController>(
        builder: (controller) {
          return RequestHandlerView(
            status: controller.requestStatus,
            child: CustomNotificationListView(
              notifications: controller.notifications,
              deleteNotifications: controller.deleteNotifications,
            ),
          );
        },
      ),
    );
  }
}
