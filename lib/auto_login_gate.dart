import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api/devices_api.dart';
import 'models/device/device.dart';
import 'providers/device/device_list_provider.dart';
import 'services/auth/auth_service.dart';

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
      final res = await DevicesApi.myDevices();
      final devices = res['data'].map((e) => Device.fromJson(e)).toList();
      ref.read(deviceListProvider.notifier).set(devices);
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
