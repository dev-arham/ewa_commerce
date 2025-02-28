import 'package:ewa_store/common/styles/spacing_styles.dart';
import 'package:ewa_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ewa_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
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
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
