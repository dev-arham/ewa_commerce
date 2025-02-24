import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ewa_store/common/widgets/products/cart/promo_code_field.dart';
import 'package:ewa_store/features/shop/controllers/checkout_controller.dart';
import 'package:ewa_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ewa_store/features/shop/screens/checkout/widgets/billing_address.dart';
import 'package:ewa_store/features/shop/screens/checkout/widgets/billing_payment.dart';
import 'package:ewa_store/features/shop/screens/checkout/widgets/billing_amount.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.subTotal});

  final double subTotal;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(CheckoutController());
    controller.subTotal.value = subTotal;
    controller.fullNameController.text = controller.user.value.fullName;
    controller.phoneNumberController.text = controller.user.value.phoneNumber;
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: controller.submitOrder,
          child: Obx(() => Text("PKR ${controller.totalPrice}")),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const CartItems(showAddRemoveButton: false),
              const SizedBox(height: TSizes.spaceBtwSections),
              const PromoCodeField(),
              const SizedBox(height: TSizes.spaceBtwSections),
              RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: isDark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    BillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    BillingAddressSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    BillingPaymentSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
