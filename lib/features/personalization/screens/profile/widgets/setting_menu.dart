import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SettingMenuWidget extends StatelessWidget {
  const SettingMenuWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    this.onPress,
    this.textColor,
    this.trailing,
  });

  final String title, subTitle;
  final IconData icon;
  final VoidCallback? onPress;
  final Color? textColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    var isDark = THelperFunctions.isDarkMode(context);
    var iconColor = isDark ? TColors.primary : TColors.accent;

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          color: iconColor.withValues(alpha: 0.1),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.apply(color: textColor),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium?.apply(color: textColor),
      ),

      trailing: trailing,
    );
  }
}
