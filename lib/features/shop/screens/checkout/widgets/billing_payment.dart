import 'package:ewa_store/common/widgets/texts/section_heading.dart';
import 'package:ewa_store/features/shop/controllers/checkout_controller.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = CheckoutController.to;
    return Column(
      children: [
        SectionHeading(title: "Payment Method", showActionButton: false),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        SizedBox(
          width: double.infinity,
          child: Card(
            color: isDark ? TColors.darkContainer : TColors.lightContainer,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 5,
              ),
              child: Obx(
                () => DropdownButton(
                  onChanged: (value) {
                    controller.paymentMethod.value = value.toString();
                  },
                  icon: Icon(
                    Iconsax.arrow_down_14,
                    color: isDark ? TColors.white : TColors.dark,
                  ),
                  value: controller.paymentMethod.value,
                  elevation: 0,
                  underline: Container(),
                  dropdownColor:
                      isDark ? TColors.darkerGrey : TColors.lightContainer,
                  borderRadius: BorderRadius.circular(TSizes.sm),
                  style: TextStyle(
                    color: isDark ? TColors.white : TColors.darkerGrey,
                  ),
                  items: [
                    DropdownMenuItem(
                      value: "cod",
                      child: SizedBox(
                        width: 230,
                        child: Text("Cash on Delivery"),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "prepaid",
                      child: SizedBox(width: 230, child: Text("Stripe")),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
