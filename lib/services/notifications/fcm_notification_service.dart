import 'package:firebase_messaging/firebase_messaging.dart';

import '../../utils/log_utils.dart';

class FcmNotificationService {
  FcmNotificationService._();

  static Future<void> init() async {
    FirebaseMessaging.onMessage.listen((message) {
      LogUtils.d('onMessage data=${message.data}');
      final n = message.notification;
      LogUtils.d('onMessage notification title=${n?.title} body=${n?.body}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      LogUtils.d('onMessageOpenedApp data=${message.data}');
      final n = message.notification;
      LogUtils.d(
        'onMessageOpenedApp notification title=${n?.title} body=${n?.body}',
      );
    });

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
