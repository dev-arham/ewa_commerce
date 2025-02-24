import 'package:ewa_store/common/widgets/icons/circular_icon.dart';
import 'package:ewa_store/features/shop/controllers/cart_controller.dart';
import 'package:ewa_store/features/shop/models/porduct_model.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = CartController.to;
    controller.updateAlreadyAddedProductCount(product);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
        vertical: TSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: isDark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: TColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: TColors.white,
                  onPressed: () => controller.productQuantity < 1
                      ? null
                      : controller.productQuantity.value--,
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  controller.productQuantity.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                CircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: TColors.black,
                  width: 40,
                  height: 40,
                  color: TColors.white,
                  onPressed: () => controller.productQuantity.value++,
                ),
              ],
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: TColors.black,
              ),
              onPressed: () => controller.addToCart(product),
              child: Text(
                "Add to Cart",
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: TColors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
