import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:time_tracker/core/services/local_notification_service.dart';
import 'package:time_tracker/data/resources/local_data_resource.dart';
import 'package:time_tracker/data/resources/mappers/notification_mapper.dart';
import 'package:time_tracker/data/resources/models/notification_dto.dart';
import 'package:time_tracker/domain/entities/notification_output.dart';
import 'package:time_tracker/core/services/injection.dart' as di;

import '../../ui/screens/login/auth_cubit.dart';

class FcmService {
  FcmService(this.localNotificationService);

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final LocalNotificationService localNotificationService;

  final BehaviorSubject<NotificationOutput> onMessageOpenedApp =
      BehaviorSubject();
  final BehaviorSubject<NotificationOutput> onInitialMessage =
      BehaviorSubject();

  Future initialize() async {
    _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    final token = await getFcmToken();
    debugPrint("FCM TOKEN : $token");

    // When app is in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle local notification
      localNotificationService.showNotification(message);
    });

    // When open app from terminated
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      // Handle if user tap on notification (terminated)
      if (message != null) {
        var response = NotificationDto.fromJson((message.data)).toEntity();
        onInitialMessage.add(response);
      }
    });

    // When app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // Handle if user tap on notification (background)
      var response = NotificationDto.fromJson((message.data)).toEntity();
      onMessageOpenedApp.add(response);
    });

    FirebaseMessaging.instance.onTokenRefresh.listen((token) {
      // Send this token.
      var cubit = di.sl<AuthCubit>();
      cubit.registerFcmToken(token);
      di.sl<LocalDataResource>().setFcmRefreshToken(token);
    });
  }

  Future<String?> getFcmToken() async {
    String? fcmKey = await FirebaseMessaging.instance.getToken();
    return fcmKey;
  }
}
