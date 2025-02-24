import 'package:cached_network_image/cached_network_image.dart';
import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:ewa_store/common/widgets/icons/favorite_icon.dart';
import 'package:ewa_store/common/widgets/images/rounded_image.dart';
import 'package:ewa_store/features/shop/controllers/product_details_screen_controller.dart';
import 'package:ewa_store/features/shop/models/porduct_model.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImageSlider extends StatelessWidget {
  final List<ProductImage> images;
  final String productId;
  const ProductImageSlider({
    super.key,
    required this.images,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ProductDetailsScreenController());
    return CurvedEdgeWidget(
      child: Container(
        color: isDark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            Obx(
              () => SizedBox(
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.productImageRadius),
                  child: SizedBox(
                    height: 400,
                    child: CachedNetworkImage(
                        imageUrl:
                            images[controller.selectedImageIndex.value].url),
                  ),
                ),
              ),
            ),
            images.length == 1
                ? const SizedBox.shrink()
                : Positioned(
                    right: 0,
                    bottom: 30,
                    left: TSizes.defaultSpace,
                    child: SizedBox(
                      height: 80,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        separatorBuilder: (_, __) => const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),
                        itemCount: images.length,
                        itemBuilder: (_, index) => RoundedImage(
                          width: 80,
                          backgroundColor:
                              isDark ? TColors.dark : TColors.light,
                          border: Border.all(color: TColors.primary),
                          padding: const EdgeInsets.all(TSizes.sm),
                          imageUrl: images[index].url,
                          isNetworkImage: true,
                          onPressed: () =>
                              controller.setSelectedImageIndex(index),
                        ),
                      ),
                    ),
                  ),
            CustomAppbar(
              showBackArrow: true,
              actions: [
                FavoriteIcon(
                  productId: productId,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
