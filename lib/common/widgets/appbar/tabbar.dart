import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/device/device_utility.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomTabbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabbar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Material(
      color: isDark ? TColors.black : TColors.white,
      child: TabBar(
        tabs: tabs,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: TColors.primary,
        labelColor: isDark ? TColors.white : TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
