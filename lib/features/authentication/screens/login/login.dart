import 'package:ewa_store/common/styles/spacing_styles.dart';
import 'package:ewa_store/common/widgets/login_signup/form_divider.dart';
import 'package:ewa_store/common/widgets/login_signup/social_buttons.dart';
import 'package:ewa_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ewa_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: <Widget>[
              const LoginHeader(),
              const LoginForm(),
              FormDivider(
                text: TTexts.orSignInWith.toUpperCase(),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const SocialButtons(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
