import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_feeder_remote/providers/user_data_sync_provider.dart';
import 'package:smart_feeder_remote/utils/log_utils.dart';
import 'package:smart_feeder_remote/utils/toast_utils.dart';
import 'package:smart_feeder_remote/widgets/buttons/app_icon_button.dart';
import 'package:smart_feeder_remote/widgets/dialogs/primary_device_select_dialog.dart';

class MainScreen extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      await ref.read(userDataSyncProvider).upsertFcmToken();
      await ref.read(userDataSyncProvider).loadDevices();
      await ref.read(userDataSyncProvider).loadMqttLogs();
      await ref.read(userDataSyncProvider).initMqttSub();
    } catch (e) {
      LogUtils.e(e);
      ToastUtils.error('초기 데이터를 불러오지 못했습니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Feeder Remote'),
        centerTitle: true,
        actionsPadding: const EdgeInsets.only(right: 16),
        actions: [
          AppIconButton(
            bgColor: Colors.transparent,
            fgColor: Colors.white,
            icon: Icons.devices,
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const PrimaryDeviceSelectDialog(),
              );
            },
          ),
        ],
      ),
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: (i) => widget.navigationShell.goBranch(i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.pets), label: '급식'),
          // NavigationDestination(icon: Icon(Icons.schedule), label: '스케줄'),
          NavigationDestination(icon: Icon(Icons.history), label: '기록'),
          NavigationDestination(icon: Icon(Icons.info_outline), label: '정보'),
        ],
      ),
    );
  }
}
