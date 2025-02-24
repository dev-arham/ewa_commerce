import 'package:ewa_store/common/widgets/login_signup/form_divider.dart';
import 'package:ewa_store/common/widgets/login_signup/social_buttons.dart';
import 'package:ewa_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              const SignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),
              FormDivider(
                text: TTexts.orSignUpWith.toUpperCase(),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const SocialButtons(),
              const SizedBox(height: TSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}
