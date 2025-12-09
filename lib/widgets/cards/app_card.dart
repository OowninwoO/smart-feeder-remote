import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.color, required this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      color: color,
      child: child,
    );
  }
}
