import 'package:ewa_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnboardingController.to.skipPage(),
        child: const Text("Skip"),
      ),
    );
  }
}
