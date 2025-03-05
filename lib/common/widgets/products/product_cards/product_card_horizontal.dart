import 'package:ewa_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ewa_store/common/widgets/icons/favorite_icon.dart';
import 'package:ewa_store/common/widgets/images/rounded_image.dart';
import 'package:ewa_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ewa_store/common/widgets/texts/product_price_text.dart';
import 'package:ewa_store/common/widgets/texts/product_title_text.dart';
import 'package:ewa_store/features/shop/models/porduct_model.dart';
import 'package:ewa_store/features/shop/screens/product_details/product_details_screen.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCardHorizontal extends StatelessWidget {
  final ProductModel product;
  final void Function()? onTap;
  const ProductCardHorizontal({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsScreen(product: product));
      },
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: isDark ? TColors.darkerGrey : TColors.softGrey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.xs),
              backgroundColor: isDark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: RoundedImage(
                      imageUrl: product.images.first.url,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
                  ),
                  product.productDiscountPercentage == '0%'
                      ? const SizedBox.shrink()
                      : Positioned(
                        top: 4,
                        left: 4,
                        child: RoundedContainer(
                          borderRadius: TSizes.sm,
                          backgroundColor: TColors.primary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.sm,
                            vertical: TSizes.xs,
                          ),
                          child: Text(
                            product.productDiscountPercentage,
                            style: Theme.of(
                              context,
                            ).textTheme.labelLarge!.apply(color: TColors.white),
                          ),
                        ),
                      ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: FavoriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 180,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductTitleText(title: product.name, smallSize: false),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        BrandTitleTextWithVerifiedIcon(
                          title: product.proBrand.name,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                      ],
                    ),
                    Expanded(
                      child: ProductPriceText(
                        price: product.offerPrice.toString(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
