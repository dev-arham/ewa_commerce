import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/common/widgets/images/circular_image.dart';
import 'package:ewa_store/common/widgets/shimmer_box/shimmer_effect.dart';
import 'package:ewa_store/common/widgets/texts/section_heading.dart';
import 'package:ewa_store/features/personalization/controllers/user_controller.dart';
import 'package:ewa_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:ewa_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.to;
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title:
            Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Obx(
                          () => controller.imageUploading.value
                              ? const ShimmerEffect(
                                  height: 100,
                                  width: 100,
                                  radius: 100,
                                )
                              : CircularImage(
                                  image: controller.user.value.profilePicture,
                                  width: 100,
                                  height: 100,
                                  isNetworkImage: true,
                                ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: TColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Iconsax.edit,
                                  color: Colors.white,
                                  size: TSizes.iconSm,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const SectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              ProfileMenu(
                title: 'Full Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              ProfileMenu(
                title: 'Username',
                value: controller.user.value.username,
                onPressed: () {},
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
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              ProfileMenu(
                title: 'Email',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Date of Birth',
                value: '19 September, 2006',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () => {},
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: TColors.primary),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
