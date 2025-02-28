import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/features/shop/controllers/order_screen_controller.dart';
import 'package:ewa_store/features/shop/screens/order/widgets/order_list_items.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderScreenController = Get.put(OrderScreenController());
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(
          "My Orders",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
            onPressed:
                () =>
                    orderScreenController.fetchOrdersFromCloud(showSnack: true),
            icon: const Icon(Iconsax.refresh),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: OrderListItems(),
      ),
    );
  }
}
