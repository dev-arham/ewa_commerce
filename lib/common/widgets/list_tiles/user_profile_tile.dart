import 'package:ewa_store/common/widgets/images/circular_image.dart';
import 'package:ewa_store/common/widgets/shimmer_box/shimmer_effect.dart';
import 'package:ewa_store/features/personalization/controllers/user_controller.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.to;
    final isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Stack(
                children: [
                  Obx(
                    () =>
                        controller.imageUploading.value
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
                              backgroundColor:
                                  isDark
                                      ? TColors.darkContainer
                                      : TColors.lightContainer,
                            ),
                  ),
                  // Positioned(
                  //   bottom: 0,
                  //   right: 0,
                  //   child: Container(
                  //     width: 30,
                  //     height: 30,
                  //     decoration: const BoxDecoration(
                  //       color: TColors.primary,
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: Center(
                  //       child: IconButton(
                  //         onPressed: () {},
                  //         icon: const Icon(
                  //           Iconsax.edit,
                  //           color: Colors.white,
                  //           size: TSizes.iconSm,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Obx(() {
          if (controller.profileLoading.value) {
            return const ShimmerEffect(height: 15, width: 80);
          } else {
            return Text(
              controller.user.value.fullName,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.apply(color: TColors.white),
            );
          }
        }),
        Text(
          controller.user.value.email,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.apply(color: TColors.white),
        ),
      ],
    );
  }
}
