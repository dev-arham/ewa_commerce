import 'package:ewa_store/data/repositories/data/data_repository.dart';
import 'package:ewa_store/features/personalization/controllers/user_controller.dart';
import 'package:ewa_store/features/shop/controllers/data_controller.dart';
import 'package:ewa_store/features/shop/models/order_model.dart';
import 'package:ewa_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class OrderScreenController extends GetxController {
  static OrderScreenController get to => Get.find();

  OrderScreenController() {
    fetchOrders();
  }

  final allOrders = <OrderModel>[].obs;
  final isLoading = false.obs;
  final dataController = DataController.to;
  final userId = UserController.to.user.value.id;
  final dataRepository = DataRepository.to;

  fetchOrders() {
    try {
      isLoading.value = true;
      allOrders.assignAll(
        dataController.allOrders.where((order) => order.userID?.sId == userId),
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  fetchOrdersFromCloud({bool showSnack = false}) async {
    try {
      isLoading.value = true;
      await dataRepository.fetchAllOrders();
      fetchOrders();
      if (showSnack) {
        TLoaders.successSnackBar(
          title: "Orders Updated",
          message: "Your orders have been updated",
        );
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
