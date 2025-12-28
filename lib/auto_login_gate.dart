import 'package:flutter/material.dart';

import '../api/devices_api.dart';
import '../services/auth/auth_service.dart';

class AutoLoginGate extends StatefulWidget {
  final Widget child;

  const AutoLoginGate({super.key, required this.child});

  @override
  State<AutoLoginGate> createState() => _AutoLoginGateState();
}

class _AutoLoginGateState extends State<AutoLoginGate> {
  late final Future<void> _future;

  @override
  void initState() {
    super.initState();
    _future = _loadData();
  }

  Future<void> _loadData() async {
    final user = AuthService.currentUser;

    if (user != null) {
      await DevicesApi.myDevices();
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
