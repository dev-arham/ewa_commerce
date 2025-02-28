import 'package:ewa_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ewa_store/common/widgets/shimmer_box/order_box_shimmer.dart';
import 'package:ewa_store/features/shop/controllers/order_screen_controller.dart';
import 'package:ewa_store/features/shop/screens/order/widgets/order_details.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});
  @override
  Widget build(BuildContext context) {
    final orderScreenController = OrderScreenController.to;
    final isDark = THelperFunctions.isDarkMode(context);

    return Obx(
      () =>
          orderScreenController.isLoading.value
              ? OrderBoxShimmer()
              : orderScreenController.allOrders.isEmpty
              ? const Center(child: Text("No Orders"))
              : ListView.separated(
                shrinkWrap: true,
                itemCount: orderScreenController.allOrders.length,
                separatorBuilder:
                    (_, __) => const SizedBox(height: TSizes.spaceBtwItems),
                itemBuilder: (context, index) {
                  final order = orderScreenController.allOrders[index];
                  return GestureDetector(
                    onTap: () => Get.to(() => OrderDetails(order: order)),
                    child: RoundedContainer(
                      showBorder: true,
                      padding: const EdgeInsets.all(TSizes.md),
                      backgroundColor: isDark ? TColors.dark : TColors.light,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const Icon(Iconsax.ship),
                              const SizedBox(width: TSizes.spaceBtwItems / 2),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      order.orderStatus?.capitalize ??
                                          "Processing",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyLarge!.apply(
                                        color: TColors.primary,
                                        fontWeightDelta: 1,
                                      ),
                                    ),
                                    Text(
                                      '${order.userID?.firstName} ${order.userID?.lastName}',
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.headlineSmall,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Iconsax.arrow_right_34,
                                  size: TSizes.iconSm,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(Iconsax.tag),
                                    const SizedBox(
                                      width: TSizes.spaceBtwItems / 2,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Order ID",
                                            style:
                                                Theme.of(
                                                  context,
                                                ).textTheme.labelMedium,
                                          ),
                                          Text(
                                            order.sId.toString(),
                                            style:
                                                Theme.of(
                                                  context,
                                                ).textTheme.titleMedium,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(Iconsax.calendar),
                                    const SizedBox(
                                      width: TSizes.spaceBtwItems / 2,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Order Date",
                                            style:
                                                Theme.of(
                                                  context,
                                                ).textTheme.labelMedium,
                                          ),
                                          Text(
                                            order.orderDate.toString(),
                                            style:
                                                Theme.of(
                                                  context,
                                                ).textTheme.titleMedium,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
