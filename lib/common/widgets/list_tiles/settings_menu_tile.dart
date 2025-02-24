import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Card(
      color: isDark ? TColors.darkContainer : TColors.lightContainer,
      elevation: 0,
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, size: 28, color: TColors.primary),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
