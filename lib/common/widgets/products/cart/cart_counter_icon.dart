import 'package:ewa_store/features/shop/controllers/cart_controller.dart';
import 'package:ewa_store/features/shop/screens/cart/cart_screen.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({super.key, this.iconColor});

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final isDark = THelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(
          icon: const Icon(Iconsax.shopping_bag),
          onPressed: () => Get.to(() => const CartScreen()),
          color: iconColor,
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: isDark ? TColors.white : TColors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Obx(
                () => Text(
                  controller.totalCartItems.value.toString(),
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                    color: isDark ? TColors.black : TColors.white,
                    fontSizeFactor: 0.9,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
