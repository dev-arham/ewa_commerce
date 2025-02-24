import 'package:ewa_store/features/shop/controllers/data_controller.dart';
import 'package:ewa_store/features/shop/models/porduct_model.dart';
import 'package:ewa_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  static SearchScreenController get to => Get.find();

  final productLoading = false.obs;
  final searchResults = <ProductModel>[].obs;
  final dataController = DataController.to;

  final searchTextController = TextEditingController();

  searchProducts() {
    if (searchTextController.text.isEmpty) {
      TLoaders.customToast(message: 'Please enter any text to search');
      return;
    }
    productLoading.value = true;
    searchResults.assignAll(
      dataController.allProducts.where((product) {
        return product.name.trim().toLowerCase().contains(
          searchTextController.text.trim().toLowerCase(),
        );
      }).toList(),
    );
    if (searchResults.isEmpty) {
      TLoaders.customToast(message: 'No products found');
    }
    productLoading.value = false;
  }
}
