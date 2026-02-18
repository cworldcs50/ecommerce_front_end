import 'package:jiffy/jiffy.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../data/model/notification_model.dart';

class CustomNontificationCard extends StatelessWidget {
  const CustomNontificationCard({super.key, required this.notifications});

  final NotificationModel notifications;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: AppColor.primaryColorLight,
      child: ListTile(
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryColorDark,
        ),
        subtitleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryColorDark,
        ),
        title: Text(notifications.notificationTitle),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(notifications.notificationBody, textAlign: TextAlign.start),
            Text(
              Jiffy.parse(
                notifications.notificationCreationTime.toString(),
              ).fromNow(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
