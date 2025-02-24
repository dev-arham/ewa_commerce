import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/image_strings.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(LoginController());
    final isDark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isDark ? TColors.darkGrey : TColors.grey,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => {},
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(
                TImages.google,
              ),
            ),
          ),
        ),
        // const SizedBox(
        //   width: TSizes.spaceBtwItems,
        // ),
        // Container(
        //   decoration: BoxDecoration(
        //     border: Border.all(
        //       color: isDark ? TColors.darkGrey : TColors.grey,
        //     ),
        //     borderRadius: BorderRadius.circular(100),
        //   ),
        //   child: IconButton(
        //     onPressed: () {},
        //     icon: const Image(
        //       width: TSizes.iconMd,
        //       height: TSizes.iconMd,
        //       image: AssetImage(
        //         TImages.facebook,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
