import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    this.bgColor,
    this.fgColor,
    required this.label,
    this.onPressed,
  });

  final Color? bgColor;
  final Color? fgColor;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? Colors.white,
        foregroundColor: fgColor ?? Colors.black,
        disabledBackgroundColor: bgColor ?? Colors.white,
        disabledForegroundColor: fgColor ?? Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
