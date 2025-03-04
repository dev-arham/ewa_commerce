import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(
          'Contact',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(200),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset(
                  'assets/logos/ewa_logo.jpg',
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Flexible(
              child: Text(
                'Welcome to the Ecommerce Help Center. We’re here to provide you with answers. Can’t find what you need? Try the search feature on the top right of the page',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Text(
              'Contact Us',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              tileColor:
                  isDark ? TColors.darkContainer : TColors.lightContainer,
              onTap: () {},
              title: const Text('info@easywayagencies.com'),
              leading: Icon(Iconsax.message),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              tileColor:
                  isDark ? TColors.darkContainer : TColors.lightContainer,
              onTap: () {},
              title: const Text('03XXXXXXXXX'),
              leading: Icon(Iconsax.call),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              tileColor:
                  isDark ? TColors.darkContainer : TColors.lightContainer,
              title: const Text('Karachi, Pakistan'),
              leading: Icon(Iconsax.location),
            ),
          ],
        ),
      ),
    );
  }
}
