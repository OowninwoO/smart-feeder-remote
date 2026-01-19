import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../../utils/log_utils.dart';
import 'local_notification_service.dart';

class FcmNotificationService {
  FcmNotificationService._();

  static Future<void> init() async {
    final token = await FirebaseMessaging.instance.getToken();
    LogUtils.d('fcmToken=$token');

    /// 포그라운드에선 FCM이 시스템 알림을 자동으로 띄우지 않아서 로컬 알림으로 직접 표시
    FirebaseMessaging.onMessage.listen((message) async {
      LogUtils.d('onMessage data=${message.data}');
      final n = message.notification;
      LogUtils.d('onMessage notification title=${n?.title} body=${n?.body}');

      await LocalNotificationService.show(
        title: n?.title,
        body: n?.body,
        payload: jsonEncode(message.data),
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      LogUtils.d('onMessageOpenedApp data=${message.data}');
      final n = message.notification;
      LogUtils.d(
        'onMessageOpenedApp notification title=${n?.title} body=${n?.body}',
      );
    });

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      LogUtils.d('getInitialMessage data=${initialMessage.data}');
      final n = initialMessage.notification;
      LogUtils.d(
        'getInitialMessage notification title=${n?.title} body=${n?.body}',
      );
    }
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  LogUtils.d('backgroundMessage data=${message.data}');
  final n = message.notification;
  LogUtils.d(
    'backgroundMessage notification title=${n?.title} body=${n?.body}',
  );
}
