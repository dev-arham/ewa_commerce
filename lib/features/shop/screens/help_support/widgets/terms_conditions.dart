import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(
          'Terms & Conditions',
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
                'Terms & Conditions',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                'Welcome to Ewa Ecommerce! By using our app, you agree to comply with and be bound by the following terms and conditions. Please read them carefully before making any purchase or using our services.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                '1. General Terms',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'By accessing and using Ewa Ecommerce, you confirm that you are at least 18 years old or have parental consent to use the platform.',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    'We reserve the right to modify, update, or discontinue our services at any time without prior notice.',
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                '2. User Accounts',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'You are responsible for maintaining the confidentiality of your account credentials.',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    'Any activity conducted under your account is your responsibility. If you suspect unauthorized access, notify us immediately.',
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                '3. Orders & Payments',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'All orders are subject to availability and confirmation of payment.',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    'Prices may change without prior notice, and we reserve the right to correct any errors in pricing or product descriptions.',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    'Payments must be made through the provided secure payment options. We do not store credit/debit card details.',
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                '4. Shipping & Delivery',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Delivery times are estimates and may vary due to unforeseen circumstances.',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    'Ewa Ecommerce is not liable for delays caused by external factors such as logistics partners or natural disasters.',
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                '5. Returns & Refunds',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Products may be returned within a specified period if they meet our return policy criteria.',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    'Refunds are processed based on the payment method used during purchase and may take a few business days to reflect.',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    'Items damaged due to misuse or negligence are not eligible for return or refund.',
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                '6. Intellectual Property',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'All content, including logos, images, and text, is the property of Ewa Ecommerce and may not be used without permission.',
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                '7. Limitation of Liability',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Ewa Ecommerce is not responsible for indirect, incidental, or consequential damages resulting from the use of our services.',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(
                    'We strive to ensure accuracy, but we do not guarantee that product descriptions, pricing, or availability are always error-free.',
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                '8. Governing Law',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'These terms and conditions shall be governed by the laws of the jurisdiction where Ewa Ecommerce operates.',
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
