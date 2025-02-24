import 'dart:developer';
import 'package:ewa_store/features/personalization/models/user_model.dart';
import 'package:ewa_store/utils/constants/api_constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserRepository extends GetxController {
  static UserRepository get to => Get.find();

  final dataStorage = GetStorage();

  Future<UserModel> getUserRecord() async {
    try {
      final response = await GetConnect().get("$serverURL/users/current-user",
          headers: {
            "Authorization": "Bearer ${dataStorage.read('accessToken')}"
          });
      return UserModel.fromJson(response.body['data']);
    } catch (e) {
      log("Error: $e");
      throw "Something went wrong. Please try again.";
    }
  }
  
}
