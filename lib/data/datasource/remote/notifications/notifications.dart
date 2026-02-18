import '../../../../core/class/api.dart';
import '../../../../core/constants/app_api_links.dart';

class NotificationsData {
  const NotificationsData({required this.api});

  final Api api;

  Future<dynamic> getNotifications(String userId) async {
    final result = await api.post(AppApiLinks.kGetNotifications, {
      "userId": userId,
    });

    return result.fold((l) => l, (r) => r);
  }

  Future<dynamic> deleteNotifications(
    String userId,
    String notificationId,
  ) async {
    final result = await api.post(AppApiLinks.kDeleteNotifications, {
      "userId": userId,
      "notificationId": notificationId,
    });

    return result.fold((l) => l, (r) => r);
  }
}
