import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(
          'Privacy Policy',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                'Your privacy is important to us. This Privacy Policy outlines how Ewa Ecommerce collects, uses, and protects your information when using our services.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                '1. Information We Collect',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Personal Information: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text:
                              'Name, email address, phone number, shipping address, and payment details when making a purchase.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text.rich(
                    TextSpan(
                      text: 'Usage Data: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text:
                              'Information on how you interact with our app, including browsing history and device details.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text.rich(
                    TextSpan(
                      text: 'Cookies & Tracking Technologies: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text:
                              'We use cookies to improve user experience and analyze app performance.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                '2. How We Use Your Information',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('To process and fulfill your orders.'),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text('To provide customer support and improve our services.'),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    'To personalize your shopping experience by offering tailored recommendations.',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    'To send promotional messages and updates (you can opt out anytime).',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    'To ensure the security of our platform and prevent fraudulent activities.',
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                '3. Data Protection & Security',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'We implement security measures to protect your personal data from unauthorized access, loss, or misuse.',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    'Payment information is securely processed by trusted third-party payment gateways.',
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                '4. Sharing of Information',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'We do not sell or share your personal data with third parties for marketing purposes.',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    'Your information may be shared with logistics partners to fulfill deliveries and with payment processors to complete transactions.',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    'In case of legal requirements, we may disclose information to comply with applicable laws.',
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                '5. Your Rights',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'You can request access to your personal data and ask for corrections or deletion where applicable.',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    'You can opt out of receiving promotional communications by adjusting your preferences in the app.',
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                '6. Changes to Privacy Policy',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'We may update this Privacy Policy from time to time, and the latest version will be available on our app.',
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Card(
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? TColors.darkContainer
                        : TColors.lightContainer,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.sm),
                  child: Text(
                    'For any questions or concerns regarding our Terms & Conditions or Privacy Policy, please contact our support team at info@easywayagencies.com',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
