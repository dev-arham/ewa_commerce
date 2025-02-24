import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/common/widgets/brands/brand_card.dart';
import 'package:ewa_store/common/widgets/layouts/grid_layout.dart';
import 'package:ewa_store/common/widgets/texts/section_heading.dart';
import 'package:ewa_store/features/shop/controllers/data_controller.dart';
import 'package:ewa_store/features/shop/screens/brands/brand_products_screen.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brands = DataController.to.allBrands;
    final products = DataController.to.allProducts;
    return Scaffold(
      appBar: const CustomAppbar(
        showBackArrow: true,
        title: Text("Brands"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const SectionHeading(
                  title: "All Brands", showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              GridLayout(
                mainAxisExtent: 85,
                itemCount: brands.length,
                itemBuilder: (_, index) => BrandCard(
                  brand: brands[index],
                  productCount: products
                    .where((element) =>
                        element.proBrand.id == brands.elementAt(0).id).length,
                  showBorder: true,
                  onPressed: () => Get.to(
                    () => BrandProductsScreen(
                      brand: brands[index],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
