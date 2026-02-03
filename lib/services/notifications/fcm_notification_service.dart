import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_feeder_remote/services/notifications/local_notification_service.dart';
import 'package:smart_feeder_remote/utils/log_utils.dart';

class FcmNotificationService {
  FcmNotificationService._();

  static Future<void> init(WidgetRef ref) async {
    /// 포그라운드에선 FCM이 시스템 알림을 자동으로 띄우지 않아서 로컬 알림으로 직접 표시
    FirebaseMessaging.onMessage.listen((message) async {
      final n = message.notification;

      LogUtils.d('onMessage notification title=${n?.title} body=${n?.body}');
      LogUtils.d('onMessage data=${jsonEncode(message.data)}');

      await LocalNotificationService.show(
        title: n?.title,
        body: n?.body,
        payload: jsonEncode(message.data),
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final n = message.notification;

      LogUtils.d(
        'onMessageOpenedApp notification title=${n?.title} body=${n?.body}',
      );
      LogUtils.d('onMessageOpenedApp data=${jsonEncode(message.data)}');
    });

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      final n = initialMessage.notification;

      LogUtils.d(
        'getInitialMessage notification title=${n?.title} body=${n?.body}',
      );
      LogUtils.d('getInitialMessage data=${jsonEncode(initialMessage.data)}');
    }
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  final n = message.notification;

  LogUtils.d(
    'backgroundMessage notification title=${n?.title} body=${n?.body}',
  );
  LogUtils.d('backgroundMessage data=${jsonEncode(message.data)}');
}
