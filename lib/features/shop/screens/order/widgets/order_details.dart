import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/features/shop/models/order_model.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:ewa_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(
          "Order Details",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "ID: ${order.sId}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(
                        order.sId != null
                            ? ClipboardData(text: order.sId!)
                            : ClipboardData(text: ""),
                      );
                      TLoaders.customToast(message: 'Copied to clipboard');
                    },
                    icon: Icon(Iconsax.copy, size: 18),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.sm),
              Row(
                children: [
                  Icon(Iconsax.truck, size: 25, color: TColors.primary),
                  SizedBox(width: TSizes.spaceBtwItems / 2),
                  Text(
                    "Status: ${order.orderStatus.toString().capitalize}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              const SizedBox(height: TSizes.sm),
              Row(
                children: [
                  Icon(Iconsax.calendar, size: 25, color: TColors.primary),
                  SizedBox(width: TSizes.spaceBtwItems / 2),
                  Text(
                    "Date: ${order.orderDate}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),

              const SizedBox(height: TSizes.sm),
              Row(
                children: [
                  Icon(Iconsax.card, size: 25, color: TColors.primary),
                  SizedBox(width: TSizes.spaceBtwItems / 2),
                  Text(
                    "Payment Method: ${order.paymentMethod.toString().capitalize}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Subtotal:",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(width: TSizes.spaceBtwItems / 2),
                  Text(
                    "PKR ${order.orderTotal?.subTotal ?? 0}",
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.apply(color: TColors.primary),
                  ),
                ],
              ),
              SizedBox(height: TSizes.xs),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Discount:",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(width: TSizes.spaceBtwItems / 2),
                  Text(
                    "PKR ${order.orderTotal?.discount}",
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.apply(color: TColors.primary),
                  ),
                ],
              ),
              SizedBox(height: TSizes.xs),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Total:",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(width: TSizes.spaceBtwItems / 2),
                  Text(
                    "PKR ${order.totalPrice}",
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium!.apply(color: TColors.primary),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text("Items:", style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.sm),
              Card(
                color: isDark ? TColors.darkContainer : TColors.lightContainer,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: order.items?.length ?? 0,
                        separatorBuilder:
                            (_, __) =>
                                const SizedBox(height: TSizes.spaceBtwItems),
                        itemBuilder: (context, index) {
                          final item = order.items![index];
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${item.quantity}x",
                                    style:
                                        Theme.of(
                                          context,
                                        ).textTheme.headlineSmall,
                                  ),
                                  SizedBox(width: TSizes.spaceBtwItems / 2),
                                  Expanded(
                                    child: Text(
                                      item.productName ?? "",
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.headlineSmall,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems / 2),
                              Row(
                                children: [
                                  Text(
                                    "PKR ${item.price}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .apply(color: TColors.primary),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                "Shipping Details:",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.sm),
              Card(
                color: isDark ? TColors.darkContainer : TColors.lightContainer,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Iconsax.user, size: 18, color: TColors.primary),
                          SizedBox(width: TSizes.spaceBtwItems / 2),
                          Text(
                            "${order.userID?.firstName.toString()} ${order.userID?.lastName.toString()}",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: TSizes.sm),
                      Row(
                        children: [
                          Icon(Iconsax.call, size: 18, color: TColors.primary),
                          SizedBox(width: TSizes.spaceBtwItems / 2),
                          Text(
                            "${order.shippingAddress?.phone}",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: TSizes.sm),
                      Row(
                        children: [
                          Icon(
                            Iconsax.location,
                            size: 18,
                            color: TColors.primary,
                          ),
                          SizedBox(width: TSizes.spaceBtwItems / 2),
                          Flexible(
                            child: Text(
                              "${order.shippingAddress?.street.toString().capitalize} ${order.shippingAddress?.city.toString().capitalize} ${order.shippingAddress?.state.toString().capitalize} ${order.shippingAddress?.country.toString().capitalize}",
                              style: Theme.of(context).textTheme.titleSmall,
                              maxLines: 10,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              order.trackingUrl == null
                  ? const SizedBox(height: TSizes.spaceBtwSections)
                  : Container(
                    padding: EdgeInsets.symmetric(
                      vertical: TSizes.spaceBtwSections,
                    ),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final url = Uri.parse(order.trackingUrl.toString());
                        final response = await launchUrl(url);
                        if (!response) {
                          TLoaders.customToast(
                            message: 'Could not launch the tracking url',
                          );
                        }
                      },
                      child: Text("Track Order"),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
