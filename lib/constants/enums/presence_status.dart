import 'package:flutter/material.dart';

enum PresenceStatus {
  online('온라인', Colors.green),
  offline('오프라인', Colors.red),
  unknown('-', Colors.black);

  const PresenceStatus(this.label, this.color);

  final String label;
  final Color color;

  static PresenceStatus parse(String? v) {
    switch (v) {
      case 'online':
        return PresenceStatus.online;
      case 'offline':
        return PresenceStatus.offline;
      default:
        return PresenceStatus.unknown;
    }
  }
}
