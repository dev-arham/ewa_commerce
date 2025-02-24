import 'package:ewa_store/data/repositories/authentication/authentication_repository.dart';
import 'package:ewa_store/features/authentication/screens/login/login.dart';
import 'package:ewa_store/utils/constants/image_strings.dart';
import 'package:ewa_store/utils/helpers/network_manager.dart';
import 'package:ewa_store/utils/popups/full_screen_loader.dart';
import 'package:ewa_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get to => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    if (email.text.isNotEmpty &&
        firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        username.text.isNotEmpty &&
        phoneNumber.text.isNotEmpty &&
        password.text.isNotEmpty) {
      try {
        TFullScreenLoader.openLoadingDialog(
          "We are processing your information...",
          TImages.docerAnimation,
        );

        final isConnected = await NetworkManager.instance.isConnected();

        if (!isConnected) {
          TFullScreenLoader.stopLoading();
          TLoaders.errorSnackBar(
            title: "No Internet Connection",
            message: "Please check your internet connection and try again.",
          );
          return;
        }

        if (!signupFormKey.currentState!.validate()) {
          TFullScreenLoader.stopLoading();
          return;
        }

        if (!privacyPolicy.value) {
          TFullScreenLoader.stopLoading();
          TLoaders.warningSnackBar(
            title: "Accept Privacy Policy",
            message:
                "You must accept the privacy policy in order to create account.",
          );
          return;
        }
          await AuthenticationRepository.to.registerUser(
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          email: email.text.trim(),
          password: password.text.trim(),
          username: username.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
        );

        TFullScreenLoader.stopLoading();

        Get.offAll(() => const LoginScreen());

        TLoaders.successSnackBar(
          title: "Congratulations!",
          message: "Your account has been created!Please login to continue.",
        );

      } catch (e) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      }
    } else {
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Please fill all fields");
    }
  }
}
