import 'package:ewa_store/features/shop/screens/help_support/widgets/contact_us_screen.dart';
import 'package:ewa_store/features/shop/screens/help_support/widgets/privacy_policy.dart';
import 'package:ewa_store/features/shop/screens/help_support/widgets/terms_conditions.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help & Support',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Iconsax.support, size: 100),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'Welcome to the Ecommerce Help Center. We’re here to provide you with answers. Select a topic below to get started.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            ListTile(
              tileColor:
                  isDark ? TColors.darkContainer : TColors.lightContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
              ),
              title: const Text('Contact Us'),
              onTap: () {
                Get.to(() => const ContactUsScreen());
              },
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            ListTile(
              tileColor:
                  isDark ? TColors.darkContainer : TColors.lightContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
              ),
              title: const Text('Terms & Conditions'),
              onTap: () {
                Get.to(() => const TermsConditions());
              },
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            ListTile(
              tileColor:
                  isDark ? TColors.darkContainer : TColors.lightContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
              ),
              title: const Text('Privacy Policy'),
              onTap: () {
                Get.to(() => const PrivacyPolicy());
              },
            ),
          ],
        ),
      ),
    );
  }
}
