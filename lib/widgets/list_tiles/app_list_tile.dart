import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    this.onDark = false,
    this.leading,
    required this.title,
    this.subtitle,
    this.showTrailing = false,
    this.trailingIcon = Icons.chevron_right,
    this.onTap,
  });

  final bool onDark;
  final String? leading;
  final String title;
  final String? subtitle;
  final bool showTrailing;
  final IconData trailingIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = onDark ? AppColors.textOnDark : AppColors.textOnLight;

    return ListTile(
      leading: leading != null
          ? Text(
              leading!,
              style: TextStyle(
                color: color,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitle != null
          ? Text(subtitle!, style: TextStyle(color: color))
          : null,
      trailing: showTrailing ? Icon(trailingIcon, color: color) : null,
      onTap: onTap,
    );
  }
}
