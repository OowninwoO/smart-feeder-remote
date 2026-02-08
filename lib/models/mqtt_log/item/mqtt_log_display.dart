class MqttLogDisplay {
  final String category;
  final String title;

  const MqttLogDisplay({required this.category, required this.title});

  static const MqttLogDisplay unknown = MqttLogDisplay(
    category: '-',
    title: '-',
  );

  static MqttLogDisplay parse({
    required String topic,
    required String? payload,
  }) {
    final topicParts = topic.split('/');
    final topicRest = topicParts.sublist(2);

    if (payload == null) {
      switch (topicRest.last) {
        case 'feed_button':
          return const MqttLogDisplay(category: '조작', title: '급식 버튼');
        case 'factory_reset':
          return const MqttLogDisplay(category: '조작', title: '초기화');
        default:
          return unknown;
      }
    }

    switch (topicRest[0]) {
      case 'presence':
        switch (payload) {
          case 'online':
            return const MqttLogDisplay(category: '연결', title: '온라인');
          case 'offline':
            return const MqttLogDisplay(category: '연결', title: '오프라인');
          default:
            return unknown;
        }

      case 'activity':
        switch (topicRest[1]) {
          case 'state':
            switch (payload) {
              case 'feeding':
                return const MqttLogDisplay(category: '상태', title: '급식 중');
              case 'idle':
                return const MqttLogDisplay(category: '상태', title: '대기');
              default:
                return unknown;
            }

          case 'event':
            switch (payload) {
              case 'feeding_started_remote':
                return const MqttLogDisplay(category: '활동', title: '원격 급식 시작');
              case 'feeding_finished_remote':
                return const MqttLogDisplay(category: '활동', title: '원격 급식 완료');
              case 'feeding_started_local':
                return const MqttLogDisplay(category: '활동', title: '수동 급식 시작');
              case 'feeding_finished_local':
                return const MqttLogDisplay(category: '활동', title: '수동 급식 완료');
              default:
                return unknown;
            }

          default:
            return unknown;
        }

      default:
        return unknown;
    }
  }
}
