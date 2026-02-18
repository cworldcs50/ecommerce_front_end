import 'package:get/get.dart';
import '../../core/services/services.dart';
import '../../core/functions/handling_data.dart';
import '../../data/model/notification_model.dart';
import '../../core/constants/enums/request_status.dart';
import '../../data/datasource/remote/notifications/notifications.dart';

class NotificationsController extends GetxController {
  RequestStatus? requestStatus;
  late final Services _services;
  late List<NotificationModel> notifications;
  late final NotificationsData notificationsData;

  @override
  Future<void> onInit() async {
    super.onInit();
    await initialData();
  }

  Future<void> initialData() async {
    notifications = [];
    _services = Get.find<Services>();
    notificationsData = NotificationsData(api: _services.api);
    await getNotifications();
  }

  Future<void> getNotifications() async {
    requestStatus = RequestStatus.loading;
    update();

    final response = await notificationsData.getNotifications(
      _services.prefs.getInt("user_id")!.toString(),
    );

    final RequestStatus result = handlingData(response);

    if (RequestStatus.success == result) {
      if (response["status"] == "success") {
        notifications =
            (response["data"] as List)
                .map((notification) => NotificationModel.fromJson(notification))
                .toList();

        requestStatus = null;
      } else {
        requestStatus = RequestStatus.noData;
      }
    } else {
      requestStatus = RequestStatus.serverFailure;
    }

    update();
    await Future.delayed(const Duration(seconds: 2), () {
      requestStatus = null;
      update();
    });
  }

  Future<void> deleteNotifications(String notificationId) async {
    requestStatus = RequestStatus.loading;
    update();

    final response = await notificationsData.deleteNotifications(
      _services.prefs.getInt("user_id")!.toString(),
      notificationId,
    );

    final result = handlingData(response);

    if (RequestStatus.success == result) {
      if (response["status"] == "success") {
        notifications.removeWhere(
          (notification) => "${notification.notificationId}" == notificationId,
        );

        requestStatus = null;
      } else {
        requestStatus = RequestStatus.noData;
      }
    } else {
      requestStatus = RequestStatus.serverFailure;
    }

    update();

    await Future.delayed(const Duration(seconds: 2), () {
      requestStatus = null;
      update();
    });
  }
}
