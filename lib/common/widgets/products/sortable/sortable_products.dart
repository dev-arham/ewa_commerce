import 'package:ewa_store/common/widgets/layouts/grid_layout.dart';
import 'package:ewa_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ewa_store/features/shop/models/porduct_model.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SortableProducts extends StatelessWidget {
  final List<ProductModel> products;
  const SortableProducts({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
            labelText: "Category",
          ),
          onChanged: (value) {},
          items: [
            "Name",
            "Heighest Price",
            "Lowest Price",
            "Sale",
            "Newest",
            "Popularity"
          ]
              .map(
                (option) => DropdownMenuItem(
                  value: option,
                  child: Text(option),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        GridLayout(
          mainAxisExtent: 300,
          itemCount: products.length,
          itemBuilder: (_, index) => ProductCardVertical(
            product: products[index],
          ),
        ),
      ],
    );
  }
}
