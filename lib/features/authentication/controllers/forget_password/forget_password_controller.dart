// import 'package:ewa_store/data/repositories/authentication/authentication_repository.dart';
// import 'package:ewa_store/features/authentication/screens/password_config/reset_password.dart';
// import 'package:ewa_store/utils/constants/image_strings.dart';
// import 'package:ewa_store/utils/helpers/network_manager.dart';
// import 'package:ewa_store/utils/popups/full_screen_loader.dart';
// import 'package:ewa_store/utils/popups/loaders.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ForgetPasswordController extends GetxController {
//   static ForgetPasswordController get to => Get.find();

//   final email = TextEditingController();
//   GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

//   sendPasswordResetEmail() async {
//     try {
//       TFullScreenLoader.openLoadingDialog(
//         "Processing your request...",
//         TImages.docerAnimation,
//       );

//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }

//       if (!forgetPasswordFormKey.currentState!.validate()) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }

//       await AuthenticationRepository.to.sendPasswordResetEmail(
//         email.text.trim(),
//       );

//       TFullScreenLoader.stopLoading();

//       TLoaders.successSnackBar(
//         title: "Email Sent",
//         message: "Email link sent to rest your password".tr,
//       );

//       Get.to(() => ResetPassword(email: email.text.trim()));
//     } catch (e) {
//       TFullScreenLoader.stopLoading();
//       TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
//     }
//   }

//   resendPasswordResetEmail(String email) async {
//     try {
//       TFullScreenLoader.openLoadingDialog(
//         "Processing your request...",
//         TImages.docerAnimation,
//       );

//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }

//       await AuthenticationRepository.to.sendPasswordResetEmail(
//         email,
//       );

//       TFullScreenLoader.stopLoading();

//       TLoaders.successSnackBar(
//         title: "Email Sent",
//         message: "Email link sent to rest your password".tr,
//       );
//     } catch (e) {
//       TFullScreenLoader.stopLoading();
//       TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
//     }
//   }
// }
