import 'package:carousel_slider/carousel_slider.dart';
import 'package:ewa_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ewa_store/common/widgets/images/rounded_image.dart';
import 'package:ewa_store/features/shop/controllers/data_controller.dart';
import 'package:ewa_store/features/shop/controllers/home_controller.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        Obx(
          () => CarouselSlider(
            items: DataController.to.allPosters
                .map(
                  (banner) => RoundedImage(
                    imageUrl: banner.image,
                    isNetworkImage: true,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
              autoPlay: true,
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < DataController.to.allPosters.length; i++)
                CircularContainer(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.carouselSelectedIndex == i
                      ? TColors.primary
                      : TColors.grey,
                )
            ],
          ),
        )
      ],
    );
  }
}
