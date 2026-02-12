import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_feeder_remote/models/mqtt_log/item/mqtt_log.dart';
import 'package:smart_feeder_remote/providers/mqtt_log/mqtt_log_page_provider.dart';
import 'package:smart_feeder_remote/services/mqtt/mqtt_log_bg_store.dart';
import 'package:smart_feeder_remote/services/notifications/local_notification_service.dart';
import 'package:smart_feeder_remote/utils/log_utils.dart';

class FcmNotificationService {
  FcmNotificationService._();

  static Future<void> init(WidgetRef ref) async {
    /// 포그라운드에선 FCM이 시스템 알림을 자동으로 띄우지 않아서 로컬 알림으로 직접 표시
    FirebaseMessaging.onMessage.listen((message) async {
      final notification = message.notification;
      final data = message.data;

      LogUtils.d(
        'onMessage notification title=${notification?.title} body=${notification?.body}',
      );
      LogUtils.d('onMessage data=${jsonEncode(data)}');

      final mqttLog = MqttLog.fromFcm(data);
      ref.read(mqttLogPageProvider.notifier).prepend(mqttLog);

      /// notification 없으면 로컬 알림 안 띄움
      if (notification == null) return;

      await LocalNotificationService.show(
        title: notification.title,
        body: notification.body,
        payload: jsonEncode(data),
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final notification = message.notification;

      LogUtils.d(
        'onMessageOpenedApp notification title=${notification?.title} body=${notification?.body}',
      );
      LogUtils.d('onMessageOpenedApp data=${jsonEncode(message.data)}');
    });

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      final notification = initialMessage.notification;

      LogUtils.d(
        'getInitialMessage notification title=${notification?.title} body=${notification?.body}',
      );
      LogUtils.d('getInitialMessage data=${jsonEncode(initialMessage.data)}');
    }
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  final notification = message.notification;

  LogUtils.d(
    'backgroundMessage notification title=${notification?.title} body=${notification?.body}',
  );
  LogUtils.d('backgroundMessage data=${jsonEncode(message.data)}');

  await MqttLogBgStore.appendFromFcm(message.data);
}
