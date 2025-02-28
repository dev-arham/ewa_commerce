import 'package:ewa_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ewa_store/common/widgets/shimmer_box/shimmer_effect.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OrderBoxShimmer extends StatelessWidget {
  const OrderBoxShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Stack(
          children: [
            ShimmerEffect(width: double.infinity, height: 160),
            Positioned(
              top: 30,
              left: 10,
              child: RoundedContainer(
                width: 150,
                height: 30,
                showBorder: true,
                backgroundColor: isDark ? TColors.darkGrey : TColors.lightGrey,
              ),
            ),
            Positioned(
              bottom: 30,
              left: 10,
              child: RoundedContainer(
                width: 300,
                height: 50,
                showBorder: true,
                backgroundColor: isDark ? TColors.darkGrey : TColors.lightGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
