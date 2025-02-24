import 'dart:convert';
import 'package:ewa_store/data/repositories/data/data_repository.dart';
import 'package:ewa_store/utils/local_storage/storage_utility.dart';
import 'package:ewa_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  static WishlistController get to => Get.find();

  final productLoading = false.obs;
  final favorites = <String, bool>{}.obs;
  final wishlistProducts = [].obs;

  @override
  void onInit() async{
    super.onInit();
    await initFavorites();
    await favoriteProducts();    
  }

  Future<void> initFavorites() async {
    final json = await TLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedItems = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
        storedItems.map(
          (key, value) => MapEntry(key, value as bool),
        ),
      );
    }
  }

  bool isFavorite(String id) {
    return favorites[id] ?? false;
  }

  void toggleFavorite(String id) {
    if (!favorites.containsKey(id)) {
      favorites[id] = true;
      saveItemToLocalStorage();
      favoriteProducts();
      TLoaders.customToast(message: 'Product added to wishlist');
    } else {
      TLocalStorage.instance().removeData(id);
      favorites.remove(id);
      saveItemToLocalStorage();
      favorites.refresh();
      favoriteProducts();
      TLoaders.customToast(message: 'Product removed from wishlist');
    }
  }

  void saveItemToLocalStorage() {
    final encodedItems = json.encode(favorites);
    TLocalStorage.instance().saveData('favorites', encodedItems);
  }

  Future<void> favoriteProducts() async {
    productLoading.value = true;
    final wishlistItems = favorites.keys.toList();
    final allProducts = await DataRepository.to.getAllProducts();
    wishlistProducts.assignAll(allProducts
        .where((product) => wishlistItems.contains(product.id))
        .toList());
    productLoading.value = false;
  }
}
