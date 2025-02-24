import 'package:get/get.dart';

class ProductDetailsScreenController extends GetxController {
  static ProductDetailsScreenController get to => Get.find();

  final selectedImageIndex = 0.obs;
  final productQuantity = 1.obs;

  void setSelectedImageIndex(int index) {
    selectedImageIndex.value = index;
  }

  void incrementQuantity() {
    productQuantity.value++;
  }

  void decrementQuantity() {
    if (productQuantity.value > 1) {
      productQuantity.value--;
    }
  }
}