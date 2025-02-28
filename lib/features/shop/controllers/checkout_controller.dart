import 'dart:developer';
import 'package:ewa_store/common/widgets/success_screen/success_screen.dart';
import 'package:ewa_store/features/personalization/controllers/user_controller.dart';
import 'package:ewa_store/features/shop/controllers/cart_controller.dart';
import 'package:ewa_store/features/shop/models/cart_item_model.dart';
import 'package:ewa_store/features/shop/models/coupon_model.dart';
import 'package:ewa_store/navigation_menu.dart';
import 'package:ewa_store/utils/constants/api_constants.dart';
import 'package:ewa_store/utils/constants/image_strings.dart';
import 'package:ewa_store/utils/local_storage/storage_utility.dart';
import 'package:ewa_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get to => Get.find();

  final user = UserController.to.user;
  final cartController = CartController.to;

  final subTotal = 0.0.obs;
  final shippingPrice = 250.0.obs;
  final promoDiscount = 0.0.obs;
  final totalPrice = 0.0.obs;
  final paymentMethod = 'cod'.obs;
  Rx<Coupon> appliedCoupon = Coupon().obs;

  final promoCodeController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final postalCodeController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();

  final addressFormKey = GlobalKey<FormState>();

  CheckoutController() {
    getUserAddress();
  }

  getUserAddress() {
    streetController.text =
        TLocalStorage.instance().readData('user_street') ?? '';
    cityController.text = TLocalStorage.instance().readData('user_city') ?? '';
    postalCodeController.text =
        TLocalStorage.instance().readData('user_postal_code') ?? '';
    stateController.text =
        TLocalStorage.instance().readData('user_state') ?? '';
    countryController.text =
        TLocalStorage.instance().readData('user_country') ?? '';
  }

  void calculateTotalPrice(
    double subTotal,
    double shippingPrice,
    double promoDiscount,
  ) {
    totalPrice.value = ((subTotal + shippingPrice) - promoDiscount);
  }

  getCouponDiscount(Coupon coupon) {
    final discountType = coupon.discountType;
    if (discountType == 'fixed') {
      promoDiscount.value = coupon.discountAmount ?? 0;
      calculateTotalPrice(
        subTotal.value,
        shippingPrice.value,
        promoDiscount.value,
      );
    } else {
      final discountPercentage = coupon.discountAmount ?? 0;
      final amountAfterDiscount = subTotal.value * (discountPercentage / 100);
      promoDiscount.value = amountAfterDiscount;
      calculateTotalPrice(
        subTotal.value,
        shippingPrice.value,
        promoDiscount.value,
      );
    }
  }

  applyPromoCode() async {
    try {
      if (promoCodeController.text.isEmpty) {
        TLoaders.customToast(message: 'Please enter a promo code first');
        return;
      }
      List<String> productIds =
          cartController.cartItems.map((e) => e.productId).toList();
      Map<String, dynamic> couponData = {
        'couponCode': promoCodeController.text,
        'purchaseAmount': subTotal.value,
        'productIds': productIds,
      };
      final response = await GetConnect().post(
        '$serverURL/couponCodes/check-coupon',
        couponData,
      );
      // print(response.body);
      if (response.isOk) {
        final responseData = response.body;
        final Coupon coupon = Coupon.fromJson(responseData['data']);
        appliedCoupon(coupon);
        getCouponDiscount(appliedCoupon.value);
        TLoaders.customToast(message: 'Promo code applied successfully');
      }
    } catch (e) {
      TLoaders.customToast(message: 'Invalid promo code');
    }
  }

  List<Map<String, dynamic>> cartItemToOrderItem(
    List<CartItemModel> cartItems,
  ) {
    return cartItems
        .map(
          (item) => {
            'productID': item.productId,
            'productName': item.title,
            'quantity': item.quantity,
            'price': item.price,
          },
        )
        .toList();
  }

  void submitOrder() async {
    if (paymentMethod.value == 'cod') {
      placeOrder();
    } else if (paymentMethod.value == 'prepaid') {
      await stripePayment(
        operation: () async {
          await placeOrder();
        },
      );
    }
  }

  placeOrder() async {
    try {
      if (!addressFormKey.currentState!.validate()) {
        TLoaders.customToast(message: 'Please fill all the fields');
        return;
      }
      final addressData = {
        'phone': phoneNumberController.text,
        'street': streetController.text,
        'city': cityController.text,
        'postalCode': postalCodeController.text,
        'state': stateController.text,
        'country': countryController.text,
      };
      final totalData = {
        'subtotal': subTotal.value,
        'discount': promoDiscount.value,
        'total': totalPrice.value,
      };
      final orderData = {
        'userID': user.value.id,
        'orderStatus': 'pending',
        'items': cartItemToOrderItem(cartController.cartItems),
        'totalPrice': totalPrice.value,
        'shippingAddress': addressData,
        'paymentMethod': paymentMethod.value,
        'couponCode': appliedCoupon.value.sId,
        'orderTotal': totalData,
      };
      final response = await GetConnect().post('$serverURL/orders', orderData);
      if (response.isOk) {
        cartController.clearCart();
        TLoaders.successSnackBar(
          title: 'Order placed successfully',
          message: response.body['message'],
        );
        Get.to(
          () => SuccessScreen(
            image: TImages.successfulPaymentIcon,
            title: "Order Placed",
            subTitle: "Your order has been placed successfully",
            onPressed: () => Get.offAll(() => NavigationMenu()),
          ),
        );
        TLocalStorage.instance().saveData('user_street', streetController.text);
        TLocalStorage.instance().saveData('user_city', cityController.text);
        TLocalStorage.instance().saveData(
          'user_postal_code',
          postalCodeController.text,
        );
        TLocalStorage.instance().saveData('user_state', stateController.text);
        TLocalStorage.instance().saveData(
          'user_country',
          countryController.text,
        );
      }
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Error',
        message: 'Something went wrong: $e',
      );
    }
  }

  Future<void> stripePayment({required void Function() operation}) async {
    try {
      Map<String, dynamic> paymentData = {
        'email': user.value.email,
        'name': user.value.fullName,
        'address': {
          'line1': streetController.text,
          'city': cityController.text,
          'postal_code': postalCodeController.text,
          'state': stateController.text,
          'country': 'PK',
        },
        'amount': totalPrice.value * 100,
        'currency': 'pkr',
        'description': 'Payment for Ewa Store by ${user.value.fullName}',
      };
      final response = await GetConnect().post(
        '$serverURL/payment/stripe',
        paymentData,
      );
      if (response.isOk) {
        final data = response.body;
        final paymentIntent = data['paymentIntent'];
        final ephemeralKey = data['ephemeralKey'];
        final customer = data['customer'];
        final publishableKey = data['publishableKey'];

        Stripe.publishableKey = publishableKey;
        BillingDetails billingDetails = BillingDetails(
          email: user.value.email,
          phone: phoneNumberController.text,
          name: user.value.fullName,
          address: Address(
            city: cityController.text,
            country: 'PK',
            line1: streetController.text,
            postalCode: postalCodeController.text,
            state: stateController.text,
            line2: '',
          ),
        );
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            customFlow: false,
            merchantDisplayName: 'Ewa Store',
            paymentIntentClientSecret: paymentIntent,
            customerEphemeralKeySecret: ephemeralKey,
            customerId: customer,
            billingDetails: billingDetails,
          ),
        );
        await Stripe.instance
            .presentPaymentSheet()
            .then((value) {
              log('payment success');
              TLoaders.successSnackBar(
                title: 'Payment Successful',
                message: 'Your payment has been processed successfully',
              );
              operation();
            })
            .onError((error, stackTrace) {
              if (error is StripeException) {
                TLoaders.errorSnackBar(
                  title: 'Payment Failed',
                  message: error.error.localizedMessage,
                );
              } else {
                TLoaders.errorSnackBar(
                  title: 'Payment Failed',
                  message: 'Something went wrong: $error',
                );
              }
            });
      }
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Error',
        message: 'Something went wrong: $e',
      );
    }
  }
}
