import 'package:ewa_store/data/repositories/user/user_repository.dart';
import 'package:ewa_store/features/personalization/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.getUserRecord();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Future<void> saveUserRecord(UserModel userCredentials) async {
  //   try {
  //     await fetchUserRecord();
  //     if (user.value.id.isEmpty) {
  //       if (userCredentials.id.isNotEmpty) {
  //         final nameParts = UserModel.nameParts(userCredentials.fullName);
  //         final username = UserModel.generateUsername(userCredentials.fullName);

  //         final user = UserModel(
  //           id: userCredentials.id,
  //           firstName: nameParts[0],
  //           lastName:
  //               nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
  //           username: username,
  //           email: userCredentials.email,
  //           phoneNumber: userCredentials.phoneNumber,
  //           profilePicture: userCredentials.profilePicture,
  //         );

  //         await userRepository.saveUserRecord(user);
  //       }
  //     }
  //   } catch (e) {
  //     TLoaders.warningSnackBar(
  //       title: "Data not saved",
  //       message:
  //           "Something went wrong while saving your information. You can re-save your data in your Profile",
  //     );
  //   }
  // }

  // void deleteAccountWarningPopup() {
  //   Get.defaultDialog(
  //     contentPadding: const EdgeInsets.all(TSizes.md),
  //     title: "Delete Account",
  //     middleText:
  //         "Are you sure you want to delete your account? This action is not reversible and all of your data will be removed permanently.",
  //     confirm: ElevatedButton(
  //       onPressed: () async => deleteUserAccount(),
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: Colors.red,
  //         side: const BorderSide(
  //           color: Colors.red,
  //         ),
  //       ),
  //       child: const Padding(
  //         padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
  //         child: Text(
  //           "Delete",
  //           style: TextStyle(color: Colors.white),
  //         ),
  //       ),
  //     ),
  //     cancel: OutlinedButton(
  //       onPressed: () => Navigator.of(Get.overlayContext!).pop(),
  //       child: const Text("Cancel"),
  //     ),
  //   );
  // }

  // void deleteUserAccount() async {
  //   try {
  //     TFullScreenLoader.openLoadingDialog(
  //       "Processing...",
  //       TImages.docerAnimation,
  //     );

  //     final auth = AuthenticationRepository.to;
  //     final provider = auth.authUser?.appMetadata['provider'];
  //     if (provider.isNotEmpty) {
  //       if (provider == "google") {
  //         await auth.loginWithGoogle();
  //         await auth.deleteAccount();
  //         TFullScreenLoader.stopLoading();
  //         Get.offAll(() => const LoginScreen());
  //       } else if (provider == 'email') {
  //         TFullScreenLoader.stopLoading();
  //         Get.to(() => const ReAuthLoginForm());
  //       }
  //     }
  //   } catch (e) {
  //     TFullScreenLoader.stopLoading();
  //     TLoaders.warningSnackBar(
  //       title: "Oh Snap!",
  //       message: e.toString(),
  //     );
  //   }
  // }

  // Future<void> reAuthenticateEmailAndPasswordUser() async {
  //   try {
  //     TFullScreenLoader.openLoadingDialog(
  //       "Processing...",
  //       TImages.docerAnimation,
  //     );

  //     final isConnected = await NetworkManager.instance.isConnected();
  //     if (!isConnected) {
  //       TFullScreenLoader.stopLoading();
  //       return;
  //     }

  //     if (!reAuthFormKey.currentState!.validate()) {
  //       TFullScreenLoader.stopLoading();
  //       return;
  //     }

  //     await AuthenticationRepository.to.reAuthenticateEmailAndPassword(
  //       verifyEmail.text.trim(),
  //       verifyPassword.text.trim(),
  //     );
  //     await AuthenticationRepository.to.deleteAccount();

  //     TFullScreenLoader.stopLoading();
  //     Get.offAll(() => const LoginScreen());
  //   } catch (e) {
  //     TFullScreenLoader.stopLoading();
  //     TLoaders.warningSnackBar(
  //       title: "Oh Snap!",
  //       message: e.toString(),
  //     );
  //   }
  // }

  // uploadUserProfilePicture() async {
  //   try {
  //     final image = await ImagePicker().pickImage(
  //       source: ImageSource.gallery,
  //       imageQuality: 70,
  //       maxHeight: 512,
  //       maxWidth: 512,
  //     );
  //     if (image != null) {
  //       imageUploading.value = true;
  //       final imageUrl =
  //           await userRepository.uploadImage("Users/Images/Profile/", image);
  //       Map<String, dynamic> data = {
  //         "ProfilePicture": imageUrl,
  //       };
  //       await userRepository.updateSingleField(data);

  //       user.value.profilePicture = imageUrl;
  //       user.refresh();

  //       TLoaders.successSnackBar(
  //         title: "Congratulations",
  //         message: "Profile picture updated successfully",
  //       );
  //     }
  //   } catch (e) {
  //     TLoaders.errorSnackBar(
  //       title: "Oh Snap!",
  //       message: "Something went wrong: $e",
  //     );
  //   } finally {
  //     imageUploading.value = false;
  //   }
  // }
}
