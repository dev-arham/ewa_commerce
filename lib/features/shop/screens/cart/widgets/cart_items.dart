import 'package:ewa_store/common/widgets/products/cart/cart_item.dart';
import 'package:ewa_store/common/widgets/products/cart/product_quantity_with_add_remove_button.dart';
import 'package:ewa_store/common/widgets/texts/product_price_text.dart';
import 'package:ewa_store/features/shop/controllers/cart_controller.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.to;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: controller.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        itemBuilder: (_, index) => Obx(() {
          final item = controller.cartItems[index];
          return Column(
            children: [
              CartItem(
                item: item,
              ),
              if (showAddRemoveButton)
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
              if (showAddRemoveButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 70,
                        ),
                        ProductQuantityWithAddRemoveButton(
                          quantity: item.quantity,
                          add: () => controller.addOneToCart(item),
                          remove: () => controller.removeOneFromCart(item),
                        ),
                      ],
                    ),
                    ProductPriceText(price: (item.price * item.quantity).toString()),
                  ],
                )
            ],
          );
        }),
      ),
    );
  }
}
