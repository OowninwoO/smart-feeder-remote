enum MqttLogCategory {
  control('조작'),
  connection('연결'),
  status('상태'),
  activity('활동'),
  unknown('기타');

  const MqttLogCategory(this.label);

  final String label;

  static MqttLogCategory parseTopic(String topic) {
    final parts = topic.split('/');
    final rest = parts.sublist(2);

    /// payload 없음
    /// feeder/{deviceId}/feed_button
    /// feeder/{deviceId}/factory_reset
    if (rest.length == 1) {
      return MqttLogCategory.control;
    }

    switch (rest[0]) {
      /// payload 있음
      /// feeder/{deviceId}/presence/online
      /// feeder/{deviceId}/presence/offline
      case 'presence':
        return MqttLogCategory.connection;

      case 'activity':
        switch (rest[1]) {
          /// payload 있음
          /// feeder/{deviceId}/activity/state/feeding
          /// feeder/{deviceId}/activity/state/idle
          /// feeder/{deviceId}/activity/state/unknown
          case 'state':
            return MqttLogCategory.status;

          /// payload 있음
          /// feeder/{deviceId}/activity/event/feeding_started_remote
          /// feeder/{deviceId}/activity/event/feeding_finished_remote
          case 'event':
            return MqttLogCategory.activity;

          default:
            return MqttLogCategory.unknown;
        }

      default:
        return MqttLogCategory.unknown;
    }
  }
}
