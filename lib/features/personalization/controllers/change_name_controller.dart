import 'package:ewa_store/features/personalization/controllers/user_controller.dart';
import 'package:ewa_store/navigation_menu.dart';
import 'package:ewa_store/utils/constants/image_strings.dart';
import 'package:ewa_store/utils/helpers/network_manager.dart';
import 'package:ewa_store/utils/popups/full_screen_loader.dart';
import 'package:ewa_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNameController extends GetxController {
  static ChangeNameController get to => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.to;
  // final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        "We are updating your information...",
        TImages.docerAnimation,
      );
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Map<String, dynamic> data = {
      //   "FirstName": firstName.text.trim(),
      //   "LastName": lastName.text.trim(),
      // };
      // await userRepository.updateSingleField(data);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      userController.user.refresh();

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: "Congratulations!",
          message: "Your name has been updated successfully");

      Get.offAll(() => const NavigationMenu());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: "Oh Snap!",
        message: e.toString(),
      );
    }
  }
}
