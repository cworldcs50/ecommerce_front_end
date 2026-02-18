import 'package:flutter/material.dart';
import 'custom_notification_card.dart';
import '../../../../data/model/notification_model.dart';

class CustomNotificationListView extends StatelessWidget {
  const CustomNotificationListView({
    super.key,
    required this.notifications,
    required this.deleteNotifications,
  });

  final List<NotificationModel> notifications;
  final Future<void> Function(String notificationId) deleteNotifications;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: notifications.length,
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder:
          (context, index) => Dismissible(
            key: Key(notifications[index].notificationId.toString()),
            onDismissed:
                (direction) async => await deleteNotifications(
                  "${notifications[index].notificationId}",
                ),
            child: CustomNontificationCard(notifications: notifications[index]),
          ),
    );
  }
}

