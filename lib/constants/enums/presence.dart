import 'package:flutter/material.dart';

enum Presence {
  online('온라인', Colors.green),
  offline('오프라인', Colors.red),
  unknown('-', Colors.black);

  const Presence(this.label, this.color);

  final String label;
  final Color color;

  static Presence parse(String? v) {
    switch (v) {
      case 'online':
        return Presence.online;
      case 'offline':
        return Presence.offline;
      default:
        return Presence.unknown;
    }
  }
}
