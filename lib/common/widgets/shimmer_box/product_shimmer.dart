import 'package:ewa_store/common/widgets/shimmer_box/shimmer_effect.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ShimmerEffect(
          width: 180,
          height: 180,
        ),
        SizedBox(height: TSizes.sm),
        ShimmerEffect(
          width: 180,
          height: 20,
        ),
        SizedBox(height: TSizes.sm),
        ShimmerEffect(
          width: 180,
          height: 10,
        ),
      ],
    );
  }
}
