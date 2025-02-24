import 'package:ewa_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ewa_store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:ewa_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:ewa_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ewa_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:ewa_store/utils/constants/image_strings.dart';
import 'package:ewa_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // PageView
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnboardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnboardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              )
            ],
          ),
          const OnboardingSkip(),
          const OnboardingDotNavigation(),
          const OnboardingNextButton(),
        ],
      ),
    );
  }
}
