import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_feeder_remote/api/mqtt_logs_api.dart';
import 'package:smart_feeder_remote/providers/device/primary_device_provider.dart';
import 'package:smart_feeder_remote/widgets/buttons/app_icon_text_button.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryDevice = ref.watch(primaryDeviceProvider);
    final deviceId = primaryDevice?.deviceId;

    return Center(
      child: AppIconTextButton(
        width: double.infinity,
        icon: const Icon(Icons.list_alt),
        label: '기록 불러오기',
        onPressed: () async {
          if (deviceId == null) return;

          await MqttLogsApi.list(deviceId: deviceId);
        },
      ),
    );
  }
}
