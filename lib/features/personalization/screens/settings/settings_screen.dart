import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ewa_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:ewa_store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:ewa_store/common/widgets/texts/section_heading.dart';
import 'package:ewa_store/data/repositories/authentication/authentication_repository.dart';
import 'package:ewa_store/features/personalization/controllers/user_controller.dart';
import 'package:ewa_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ewa_store/features/shop/screens/cart/cart_screen.dart';
import 'package:ewa_store/features/shop/screens/help_support/help_support_screen.dart';
import 'package:ewa_store/features/shop/screens/order/order_screen.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.to;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  CustomAppbar(
                    title: Text(
                      'Account',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: TColors.white),
                    ),
                  ),
                  const UserProfileTile(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const SectionHeading(
                    title: 'Profile Information',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ProfileMenu(
                    title: 'Full Name',
                    value: controller.user.value.fullName,
                    onPressed: () {},
                    icon: Iconsax.user,
                  ),
                  ProfileMenu(
                    title: 'Username',
                    value: controller.user.value.username,
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: controller.user.value.username),
                      );
                      TLoaders.customToast(
                        message: 'Username copied to clipboard',
                      );
                    },
                    icon: Iconsax.copy,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const SectionHeading(
                    title: 'Personal Information',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ProfileMenu(
                    title: 'User ID',
                    value: controller.user.value.id,
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: controller.user.value.id),
                      );
                      TLoaders.customToast(
                        message: 'User ID copied to clipboard',
                      );
                    },
                    icon: Iconsax.copy,
                  ),
                  ProfileMenu(
                    title: 'Email',
                    value: controller.user.value.email,
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: controller.user.value.email),
                      );
                      TLoaders.customToast(
                        message: 'Email copied to clipboard',
                      );
                    },
                    icon: Iconsax.copy,
                  ),
                  ProfileMenu(
                    title: 'Phone',
                    value: controller.user.value.phoneNumber,
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: controller.user.value.phoneNumber),
                      );
                      TLoaders.customToast(
                        message: 'Phone number copied to clipboard',
                      );
                    },
                    icon: Iconsax.copy,
                  ),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const SectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SettingsMenuTile(
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                    icon: Iconsax.shopping_cart,
                    onTap: () => Get.to(() => const CartScreen()),
                  ),
                  SettingsMenuTile(
                    title: 'My Orders',
                    subtitle: 'In-progress, delivered and cancelled orders',
                    icon: Iconsax.bag_tick,
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  SettingsMenuTile(
                    title: 'Help & Support',
                    subtitle: 'In-progress, delivered and cancelled orders',
                    icon: Iconsax.support4,
                    onTap: () => Get.to(() => const HelpSupportScreen()),
                  ),
                  // SettingsMenuTile(
                  //   title: 'Notifications',
                  //   subtitle: 'Enable or disable notifications',
                  //   icon: Iconsax.notification,
                  //   trailing: Switch(
                  //     value: true,
                  //     onChanged: (value) {},
                  //     activeColor: TColors.black,
                  //     activeTrackColor: TColors.primary,
                  //   ),
                  // ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => AuthenticationRepository.to.logoutUser(),
                      child: const Text('Log Out'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
