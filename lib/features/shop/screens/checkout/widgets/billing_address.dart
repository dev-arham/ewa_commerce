import 'package:ewa_store/common/widgets/texts/section_heading.dart';
import 'package:ewa_store/features/shop/controllers/checkout_controller.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.to;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(title: "Shipping Address", showActionButton: false),
        const SizedBox(height: TSizes.spaceBtwItems),
        Form(
          key: controller.addressFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.fullNameController,
                validator:
                    (value) => TValidator.validateEmptyText('Full Name', value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: "Full Name",
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                controller: controller.phoneNumberController,
                validator: (value) => TValidator.validatePhoneNumber(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.mobile),
                  labelText: "Phone Number",
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                controller: controller.streetController,
                validator:
                    (value) => TValidator.validateEmptyText('Street', value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.building_3),
                  labelText: "Address",
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.cityController,
                      validator:
                          (value) =>
                              TValidator.validateEmptyText('City', value),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.building),
                        labelText: "City",
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                      controller: controller.postalCodeController,
                      validator:
                          (value) => TValidator.validateEmptyText(
                            'Postal Code',
                            value,
                          ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.activity),
                        labelText: "Postal Code",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.stateController,
                      validator:
                          (value) =>
                              TValidator.validateEmptyText('State', value),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.activity),
                        labelText: "State",
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                      controller: controller.countryController,
                      validator:
                          (value) =>
                              TValidator.validateEmptyText('Country', value),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.global),
                        labelText: "Country",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
