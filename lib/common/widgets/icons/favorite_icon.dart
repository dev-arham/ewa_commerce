import 'package:ewa_store/common/widgets/icons/circular_icon.dart';
import 'package:ewa_store/features/shop/controllers/wishlist_controller.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WishlistController());
    return Obx(
      () => CircularIcon(
        width: 35,
        height: 35,
        size: 20,
        icon: controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: TColors.primary,
        onPressed: () => controller.toggleFavorite(productId),
      ),
    );
  }
}
