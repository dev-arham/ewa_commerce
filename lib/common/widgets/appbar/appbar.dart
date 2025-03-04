import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/device/device_utility.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.onLeadingTap,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? onLeadingTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading:
            showBackArrow
                ? IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor:
                        THelperFunctions.isDarkMode(context)
                            ? Colors.white
                            : Colors.transparent,
                  ),
                  icon: Icon(
                    leadingIcon ?? Iconsax.arrow_left,
                    color: Colors.black,
                  ),
                  onPressed: onLeadingTap ?? () => Get.back(),
                )
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
