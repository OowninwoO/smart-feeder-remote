import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_feeder_remote/api/mqtt_logs_api.dart';
import 'package:smart_feeder_remote/widgets/buttons/app_icon_text_button.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: AppIconTextButton(
        width: double.infinity,
        icon: const Icon(Icons.list_alt),
        label: '기록 불러오기',
        onPressed: () async {
          await MqttLogsApi.all();
        },
      ),
    );
  }
}
