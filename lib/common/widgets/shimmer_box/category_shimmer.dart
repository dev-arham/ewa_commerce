import 'package:ewa_store/common/widgets/shimmer_box/shimmer_effect.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/widgets.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const SizedBox(width: TSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerEffect(height: 55, width: 55, radius: 55),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              ShimmerEffect(height: 8, width: 55),
            ],
          );
        },
      ),
    );
  }
}
