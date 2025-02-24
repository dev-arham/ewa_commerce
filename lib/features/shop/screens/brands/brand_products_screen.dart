import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/common/widgets/brands/brand_card.dart';
import 'package:ewa_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:ewa_store/features/shop/controllers/data_controller.dart';
import 'package:ewa_store/features/shop/models/brand_model.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({
    super.key,
    required this.brand,
  });

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final dataController = DataController.to;
    final products = dataController.allProducts
        .where((product) => product.proBrand.id == brand.id)
        .toList();
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              BrandCard(
                showBorder: true,
                brand: brand,
                productCount: products.length,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SortableProducts(
                products: products,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
