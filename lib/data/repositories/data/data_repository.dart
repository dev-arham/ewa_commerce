import 'dart:developer';
import 'package:ewa_store/features/shop/models/brand_model.dart';
import 'package:ewa_store/features/shop/models/category_model.dart';
import 'package:ewa_store/features/shop/models/porduct_model.dart';
import 'package:ewa_store/features/shop/models/poster_model.dart';
import 'package:ewa_store/features/shop/models/sub_category_model.dart';
import 'package:ewa_store/utils/constants/api_constants.dart';
import 'package:get/get.dart';

class DataRepository extends GetxController {
  static DataRepository get to => Get.find<DataRepository>();

  final serverUrl = serverURL;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await GetConnect().get("$serverUrl/categories");

      if (response.isOk) {
        final jsonResponse = response.body;

        // Accessing 'data' key and mapping it to List<CategoryModel>
        if (jsonResponse != null && jsonResponse['data'] is List) {
          return (jsonResponse['data'] as List)
              .map((item) => CategoryModel.fromJson(item))
              .toList();
        } else {
          throw "Data is not in expected format.";
        }
      } else {
        throw "Unable to fetch sub-categories. Status code: ${response.statusCode}";
      }
    } catch (e) {
      log("Error: $e");
      throw "Something went wrong. Please try again.";
    }
  }

  Future<List<SubCategoryModel>> getAllSubCategories() async {
    try {
      final response = await GetConnect().get("$serverUrl/subCategories");

      if (response.isOk) {
        final jsonResponse = response.body;

        if (jsonResponse != null && jsonResponse['data'] is List) {
          return (jsonResponse['data'] as List)
              .map((item) => SubCategoryModel.fromJson(item))
              .toList();
        } else {
          throw "Data is not in expected format.";
        }
      } else {
        throw "Unable to fetch sub-categories. Status code: ${response.statusCode}";
      }
    } catch (e) {
      log("Error: $e");
      throw "Something went wrong. Please try again.";
    }
  }

  Future<List<BrandModel>> getAllBrands() async {
    try {
      final response = await GetConnect().get("$serverUrl/brands");

      if (response.isOk) {
        final jsonResponse = response.body;

        if (jsonResponse != null && jsonResponse['data'] is List) {
          return (jsonResponse['data'] as List)
              .map((item) => BrandModel.fromJson(item))
              .toList();
        } else {
          throw "Data is not in expected format.";
        }
      } else {
        throw "Unable to fetch sub-categories. Status code: ${response.statusCode}";
      }
    } catch (e) {
      log("Error: $e");
      throw "Something went wrong. Please try again.";
    }
  }

  Future<List<PosterModel>> getAllPosters() async {
    try {
      final response = await GetConnect().get("$serverUrl/posters");

      if (response.isOk) {
        final jsonResponse = response.body;

        if (jsonResponse != null && jsonResponse['data'] is List) {
          return (jsonResponse['data'] as List)
              .map((item) => PosterModel.fromJson(item))
              .toList();
        } else {
          throw "Data is not in expected format.";
        }
      } else {
        throw "Unable to fetch posters. Status code: ${response.statusCode}";
      }
    } catch (e) {
      log("Error: $e");
      throw "Something went wrong. Please try again.";
    }
  }

  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await GetConnect().get("$serverUrl/products");

      if (response.isOk) {
        final jsonResponse = response.body;

        if (jsonResponse != null && jsonResponse['data'] is List) {
          return (jsonResponse['data'] as List)
              .map((item) => ProductModel.fromJson(item))
              .toList();
        } else {
          throw "Data is not in expected format.";
        }
      } else {
        throw "Unable to fetch products. Status code: ${response.statusCode}";
      }
    } catch (e) {
      log("Error: $e");
      throw "Something went wrong. Please try again.";
    }
  }

  Future<List<ProductModel>> getWishlistProducts() async {
    try {
      final response = await GetConnect().get("$serverUrl/products");

      if (response.isOk) {
        final jsonResponse = response.body;

        if (jsonResponse != null && jsonResponse['data'] is List) {
          return (jsonResponse['data'] as List)
              .map((item) => ProductModel.fromJson(item))
              .toList();
        } else {
          throw "Data is not in expected format.";
        }
      } else {
        throw "Unable to fetch products. Status code: ${response.statusCode}";
      }
    } catch (e) {
      log("Error: $e");
      throw "Something went wrong. Please try again.";
    }
  }
}
