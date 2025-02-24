import 'package:ewa_store/features/shop/models/cart_item_model.dart';
import 'package:ewa_store/features/shop/models/porduct_model.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:ewa_store/utils/local_storage/storage_utility.dart';
import 'package:ewa_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get to => Get.find();

  RxInt totalCartItems = 0.obs;
  RxInt totalCartPrice = 0.obs;
  RxInt productQuantity = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  CartController() {
    loadCartItems();
  }

  void addToCart(ProductModel product) {
    if (productQuantity.value < 1) {
      TLoaders.customToast(message: 'Please select quantity');
      return;
    }

    final selectdCartItem = convertToCartItem(product, productQuantity.value);

    int index = cartItems.indexWhere(
      (cartItem) => cartItem.productId == selectdCartItem.productId,
    );

    if (index >= 0) {
      cartItems[index].quantity = selectdCartItem.quantity;
    } else {
      cartItems.add(selectdCartItem);
    }

    updateCart();
    TLoaders.customToast(message: 'Product added to cart');
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    return CartItemModel(
      productId: product.id,
      title: product.name,
      price: product.price,
      image: product.images.first.url,
      quantity: quantity,
      brandName: product.proBrand.name,
    );
  }

  void addOneToCart(CartItemModel cartItem) {
    int index = cartItems.indexWhere(
      (item) => item.productId == cartItem.productId,
    );
    if (index >= 0) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(cartItem);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel cartItem) {
    int index = cartItems.indexWhere(
      (item) => item.productId == cartItem.productId,
    );
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove from cart',
      middleText: 'Are you sure you want to remove this item from cart?',
      textConfirm: 'Confirm',
      titlePadding: EdgeInsets.only(top: TSizes.defaultSpace),
      contentPadding: EdgeInsets.all(TSizes.defaultSpace),
      backgroundColor:
          THelperFunctions.isDarkMode(Get.context!)
              ? TColors.darkerGrey
              : TColors.lightContainer,
      confirm: ElevatedButton(
        onPressed: () {
          cartItems.removeAt(index);
          updateCart();
          TLoaders.customToast(message: 'Product removed from cart');
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text('Confirm'),
      ),
      cancel: OutlinedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          side: BorderSide(color: Colors.red),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text('Cancel'),
      ),
    );
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    productQuantity.value = getProductQuantityInCart(product.id);
  }

  void updateCart() {
    updateCartTotal();
    saveCartItem();
    cartItems.refresh();
  }

  void updateCartTotal() {
    int calculatedTotalPrice = 0;
    int calculatedTotalItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += item.price * item.quantity;
      calculatedTotalItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    totalCartItems.value = calculatedTotalItems;
  }

  void saveCartItem() {
    final encodedItems = cartItems.map((item) => item.toJson()).toList();
    TLocalStorage.instance().saveData('cartItems', encodedItems);
  }

  void loadCartItems() {
    final cartItemStrings = TLocalStorage.instance().readData<List<dynamic>>(
      'cartItems',
    );
    if (cartItemStrings != null) {
      final cartItemsList =
          cartItemStrings
              .map(
                (item) => CartItemModel.fromJson(item as Map<String, dynamic>),
              )
              .toList();
      cartItems.assignAll(cartItemsList);
      updateCartTotal();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  void clearCart() {
    productQuantity.value = 0;
    cartItems.clear();
    updateCart();
  }
}
