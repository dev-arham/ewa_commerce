import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/features/shop/controllers/cart_controller.dart';
import 'package:ewa_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ewa_store/features/shop/screens/checkout/checkout_screen.dart';
import 'package:ewa_store/navigation_menu.dart';
import 'package:ewa_store/utils/constants/image_strings.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.to;
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall),
      ),
      bottomNavigationBar: Obx(
        () =>
            controller.cartItems.isEmpty
                ? const SizedBox()
                : Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ElevatedButton(
                    onPressed:
                        () => Get.to(
                          () => CheckoutScreen(
                            subTotal:
                                controller.totalCartPrice.value.toDouble(),
                          ),
                        ),
                    child: Text(
                      "Checkout PKR ${controller.totalCartPrice.value}",
                    ),
                  ),
                ),
      ),
      body: Obx(() {
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops! Cart is Empty.',
          animation: TImages.emptyCartAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );
        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: CartItems(),
            ),
          );
        }
      }),
    );
  }
}
