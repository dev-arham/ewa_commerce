import 'dart:developer';
import 'package:ewa_store/features/authentication/screens/login/login.dart';
import 'package:ewa_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ewa_store/navigation_menu.dart';
import 'package:ewa_store/utils/constants/api_constants.dart';
import 'package:ewa_store/utils/local_storage/storage_utility.dart';
import 'package:ewa_store/utils/popups/loaders.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final deviceStorage = GetStorage();

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get to => Get.find();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    if (deviceStorage.read('accessToken') != null) {
      await verifyUserWithAccessToken().then((response) async {
        if (response.isOk) {
          final userId = response.body['data']['_id'];
          await TLocalStorage.init(userId);
          Get.offAll(() => const NavigationMenu());
        } else {
          await regenerateAccessToken();
        }
      }).catchError((e) {
        log("Error: $e");
      });
    } else {
      deviceStorage.writeIfNull("isFirstTime", true);
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const Onboarding());
    }
  }

  // User Registeration
  Future<void> registerUser({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      final response = await GetConnect().post("$serverURL/users/register", {
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "email": email,
        "password": password,
        "phone": phoneNumber,
      });
      if (response.isOk) {
        return;
      } else {
        throw response.body['message'];
      }
    } catch (e) {
      log("Error: $e");
      throw "Something went wrong. Please try again.";
    }
  }

  //Login User with Email and Password

  Future<void> loginUser(
      {String? email, required String password, String? username}) async {
    try {
      final response = await GetConnect().post("$serverURL/users/login", {
        "email": email,
        "username": username,
        "password": password,
      });
      if (response.isOk) {
        deviceStorage.write('accessToken', response.body['accessToken']);
        deviceStorage.write('refreshToken', response.body['refreshToken']);
      } else {
        TLoaders.errorSnackBar(
            title: 'Error', message: response.body['message']);
      }
    } catch (e) {
      log("Error: $e");
      rethrow;
    }
  }

  //Delete User Account

  //Verify Token

  Future<Response> verifyUserWithAccessToken() async {
    try {
      final response = await GetConnect().get("$serverURL/users/verify-user",
          headers: {
            "Authorization": "Bearer ${deviceStorage.read('accessToken')}"
          });
      return response;
    } catch (e) {
      log("Error: $e");
      throw "Something went wrong. Please try again.";
    }
  }

  Future<void> regenerateAccessToken() async {
    try {
      final response = await GetConnect().post("$serverURL/users/refresh-token",
          {"refreshToken": deviceStorage.read('refreshToken')});
      if (response.isOk) {
        deviceStorage.write('accessToken', response.body['accessToken']);
        await verifyUserWithAccessToken().then((response) {
          if (response.isOk) {
            Get.offAll(() => const NavigationMenu());
          } else {
            throw response.body['message'];
          }
        }).catchError((e) {
          log("Error: $e");
          throw "Something went wrong. Please try again.";
        });
      } else {
        Get.offAll(() => const LoginScreen());
      }
    } catch (e) {
      log("Error: $e");
      throw "Something went wrong. Please try again.";
    }
  }

  //Email Verification

  //Forgot Password

  //Logout
  Future<void> logoutUser() async {
    try {
      final response = await GetConnect().post("$serverURL/users/logout", {},
          headers: {
            "Authorization": "Bearer ${deviceStorage.read('accessToken')}"
          });
      if (response.isOk) {
        deviceStorage.remove('accessToken');
        deviceStorage.remove('refreshToken');
        Get.offAll(() => const LoginScreen());
      } else {
        TLoaders.errorSnackBar(title: response.body['message']);
      }
    } catch (e) {
      log("Error: $e");
      throw "Something went wrong. Please try again.";
    }
  }
}
