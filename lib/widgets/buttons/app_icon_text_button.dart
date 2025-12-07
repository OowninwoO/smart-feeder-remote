import 'package:flutter/material.dart';

class AppIconTextButton extends StatelessWidget {
  const AppIconTextButton({
    super.key,
    this.bgColor,
    this.fgColor,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final Color? bgColor;
  final Color? fgColor;
  final Widget icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? Colors.white,
        foregroundColor: fgColor ?? Colors.black,
        disabledBackgroundColor: bgColor ?? Colors.white,
        disabledForegroundColor: fgColor ?? Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [icon, const SizedBox(width: 10), Text(label)],
      ),
    );
  }
}
