import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_feeder_remote/providers/user_data_sync_provider.dart';
import 'package:smart_feeder_remote/services/auth/auth_service.dart';
import 'package:smart_feeder_remote/utils/log_utils.dart';
import 'package:smart_feeder_remote/utils/toast_utils.dart';

class AutoLoginGate extends ConsumerStatefulWidget {
  final Widget child;

  const AutoLoginGate({super.key, required this.child});

  @override
  ConsumerState<AutoLoginGate> createState() => _AutoLoginGateState();
}

class _AutoLoginGateState extends ConsumerState<AutoLoginGate> {
  late final Future<void> _future;

  @override
  void initState() {
    super.initState();
    _future = _loadData();
  }

  Future<void> _loadData() async {
    final user = AuthService.currentUser;

    if (user != null) {
      try {
        await ref.read(userDataSyncProvider).upsertFcmToken();
        await ref.read(userDataSyncProvider).loadDevices();
        await ref.read(userDataSyncProvider).loadMqttLogs();
        await ref.read(userDataSyncProvider).initMqttSub();
      } catch (e) {
        LogUtils.e(e);
        ToastUtils.error('데이터를 불러오지 못했습니다.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: SafeArea(child: Center(child: CircularProgressIndicator())),
          );
        }

        return widget.child;
      },
    );
  }
}
