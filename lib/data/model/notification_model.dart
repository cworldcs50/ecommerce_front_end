import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  const NotificationModel({
    required this.notificationId,
    required this.notificationBody,
    required this.notificationTitle,
    required this.notificationUserId,
    required this.notificationCreationTime,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        notificationBody: json["notification_body"],
        notificationCreationTime: DateTime.parse(
          json["notification_creation_time"],
        ),
        notificationId: (json["notification_id"] as num).toInt(),
        notificationTitle: json["notification_title"],
        notificationUserId: (json["notification_user_id"] as num).toInt(),
      );

  final int notificationId;
  final String notificationBody;
  final String notificationTitle;
  final int notificationUserId;
  final DateTime notificationCreationTime;

  @override
  List<Object?> get props => [
    notificationId,
    notificationBody,
    notificationTitle,
    notificationUserId,
    notificationCreationTime,
  ];
}
