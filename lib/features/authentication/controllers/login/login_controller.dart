import 'package:ewa_store/data/repositories/authentication/authentication_repository.dart';
import 'package:ewa_store/features/personalization/controllers/user_controller.dart';
import 'package:ewa_store/utils/constants/image_strings.dart';
import 'package:ewa_store/utils/helpers/network_manager.dart';
import 'package:ewa_store/utils/popups/full_screen_loader.dart';
import 'package:ewa_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  final userController = Get.put(UserController());

  final localStorage = GetStorage();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? "";
    super.onInit();
  }

  Future<void> emailAndPasswordSignin() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        "Logging you in...",
        TImages.docerAnimation,
      );

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      await AuthenticationRepository.to.loginUser(
        email: email.text.trim(),
        password: password.text.trim(),
        username: email.text.trim(),
      );

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.to.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: "Oh Snap!",
        message: 'Something went wrong',
      );
    }
  }

  //Google Sign In
  // Future<void> googleSignIn() async {
  //   try {
  //     TFullScreenLoader.openLoadingDialog(
  //       "Logging you in...",
  //       TImages.docerAnimation,
  //     );

  //     final isConnected = await NetworkManager.instance.isConnected();
  //     if (!isConnected) {
  //       TFullScreenLoader.stopLoading();
  //       return;
  //     }

  //     final userCredentials =
  //         await AuthenticationRepository.to.loginWithGoogle();

  //     final newUser = UserModel(
  //         id: userCredentials.user!.id,
  //         email: userCredentials.user!.email!,
  //         firstName: '',
  //         lastName: '',
  //         username: '',
  //         phoneNumber: userCredentials.user!.phone ?? '',
  //         profilePicture: '',
  //       );

  //     await userController.saveUserRecord(newUser);

  //     TFullScreenLoader.stopLoading();

  //     AuthenticationRepository.to.screenRedirect();
  //   } catch (e) {
  //     TFullScreenLoader.stopLoading();
  //     TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
  //   }
  // }
}
