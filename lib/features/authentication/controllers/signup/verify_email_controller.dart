import 'package:ewa_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get to => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    // setTimerForAutoRedirect();
    super.onInit();
  }

  void sendEmailVerification() async {
    try {
      // await AuthenticationRepository.to.sendEmailVerification();
      TLoaders.successSnackBar(
          title: "Email Sent",
          message: "Please check your inbox to verify your email.");
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  // void setTimerForAutoRedirect() {
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     Supabase.instance.client.auth.refreshSession();
  //     final user = Supabase.instance.client.auth.currentUser;
  //     if (user != null && user.emailConfirmedAt != null) {
  //       timer.cancel();
  //       Get.off(
  //         () => SuccessScreen(
  //           image: TImages.deliveredEmailIllustration,
  //           title: TTexts.yourAccountCreatedTitle,
  //           subTitle: TTexts.yourAccountCreatedSubTitle,
  //           onPressed: AuthenticationRepository.to.screenRedirect,
  //         ),
  //       );
  //     }
  //   });
  // }

//   void checkEmailVerficationStatus() async {
//     final currentUser = Supabase.instance.client.auth.currentUser;
//     if (currentUser != null && currentUser.emailConfirmedAt != null) {
//       Get.off(
//         () => SuccessScreen(
//           image: TImages.deliveredEmailIllustration,
//           title: TTexts.yourAccountCreatedTitle,
//           subTitle: TTexts.yourAccountCreatedSubTitle,
//           onPressed: AuthenticationRepository.to.screenRedirect,
//         ),
//       );
//     }
//   }
}
