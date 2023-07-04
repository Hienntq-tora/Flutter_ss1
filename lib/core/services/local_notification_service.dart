import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:time_tracker/data/resources/mappers/notification_mapper.dart';
import 'package:time_tracker/data/resources/models/notification_dto.dart';
import 'package:time_tracker/domain/entities/notification_output.dart';
import 'package:url_launcher/url_launcher.dart';

class LocalNotificationService {
  LocalNotificationService();

  final FlutterLocalNotificationsPlugin _notificationPlugin =
      FlutterLocalNotificationsPlugin();

  void initialize() {
    const InitializationSettings initialSettings = InitializationSettings(
        android: AndroidInitializationSettings(
          '@mipmap/ic_launcher',
        ),
        iOS: DarwinInitializationSettings(
          requestSoundPermission: false,
          requestBadgePermission: false,
          requestAlertPermission: false,
        ));

    _notificationPlugin.initialize(
      initialSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) async {
        final response =
            NotificationDto.fromJson(jsonDecode(details.payload ?? ""))
                .toEntity();

        switch (response.type) {
          case null:
            break;
          case NotificationType.payment:
            break;
          case NotificationType.lessonApproved:
            break;
          case NotificationType.upComingLesson:
            var url = "${response.link}";
            if (await canLaunchUrl(Uri.parse(url))) {
              await launchUrl(Uri.parse(url),
                  mode: LaunchMode.externalApplication);
            }
            break;
        }
      },
    );
  }

  void showNotification(RemoteMessage message) {
    const NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'com.example.push_notification',
        'push_notification',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    _notificationPlugin.show(
      DateTime.now().microsecond,
      message.notification!.title,
      message.notification!.body,
      notificationDetails,
      payload: jsonEncode(message.data),
    );
  }
}
