import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    this.bgColor,
    this.fgColor,
    required this.icon,
    this.onPressed,
  });

  final Color? bgColor;
  final Color? fgColor;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: bgColor ?? Colors.white,
        foregroundColor: fgColor ?? Colors.black,
        disabledBackgroundColor: bgColor ?? Colors.white,
        disabledForegroundColor: fgColor ?? Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      icon: Icon(icon),
    );
  }
}
