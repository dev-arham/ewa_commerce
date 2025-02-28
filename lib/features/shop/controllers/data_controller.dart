import 'package:ewa_store/data/repositories/data/data_repository.dart';
import 'package:ewa_store/features/shop/models/brand_model.dart';
import 'package:ewa_store/features/shop/models/category_model.dart';
import 'package:ewa_store/features/shop/models/order_model.dart';
import 'package:ewa_store/features/shop/models/porduct_model.dart';
import 'package:ewa_store/features/shop/models/poster_model.dart';
import 'package:ewa_store/features/shop/models/sub_category_model.dart';
import 'package:ewa_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  static DataController get to => Get.find();

  final _categoryRepository = Get.put(DataRepository());

  final categoryLoading = false.obs;
  final productLoading = false.obs;
  final ordersLoading = false.obs;
  final wishlistProductLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<SubCategoryModel> allSubCategories = <SubCategoryModel>[].obs;
  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<PosterModel> allPosters = <PosterModel>[].obs;
  RxList<ProductModel> allProducts = <ProductModel>[].obs;
  RxList<OrderModel> allOrders = <OrderModel>[].obs;


  DataController() {
    fetchCategories();
    fetchSubCategories();
    fetchBrands();
    fetchPosters();
    fetchProducts();
    fetchOrders();
  }

  Future<void> fetchCategories() async {
    try {
      categoryLoading.value = true;
      final categories = await _categoryRepository.getAllCategories();
      allCategories.assignAll(categories);
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      categoryLoading.value = false;
    }
  }

  Future<void> fetchSubCategories() async {
    try {
      final subCategories = await _categoryRepository.getAllSubCategories();
      allSubCategories.assignAll(subCategories);
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  Future<void> fetchBrands() async {
    try {
      final brands = await _categoryRepository.getAllBrands();
      allBrands.assignAll(brands);
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  Future<void> fetchPosters() async {
    try {
      final posters = await _categoryRepository.getAllPosters();
      allPosters.assignAll(posters);
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  Future<void> fetchProducts() async {
    try {
      productLoading.value = true;
      final products = await _categoryRepository.getAllProducts();
      allProducts.assignAll(products);
      productLoading.value = false;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  Future<void> fetchOrders({bool showSnack = false}) async {
    try {
      ordersLoading.value = true;
      final orders = await _categoryRepository.fetchAllOrders();
      allOrders.assignAll(orders);
      ordersLoading.value = false;
      if (showSnack) {
        TLoaders.successSnackBar(title: "Orders Fetched Successfully");
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
  
}
