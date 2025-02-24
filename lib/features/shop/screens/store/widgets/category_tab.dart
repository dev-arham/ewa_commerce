import 'package:ewa_store/common/widgets/brands/brand_showcase.dart';
import 'package:ewa_store/common/widgets/layouts/grid_layout.dart';
import 'package:ewa_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ewa_store/common/widgets/texts/section_heading.dart';
import 'package:ewa_store/features/shop/controllers/data_controller.dart';
import 'package:ewa_store/features/shop/models/category_model.dart';
import 'package:ewa_store/features/shop/screens/brands/brand_products_screen.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final brands = DataController.to.allBrands.where(
      (element) => element.parentCategoryId == category.id,
    );
    final products = DataController.to.allProducts
        .where(
          (element) => element.proCategory.id == category.id,
        )
        .toList();
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              BrandShowcase(
                brandModel: brands.elementAt(0),
                productCount: products
                    .where((element) =>
                        element.proBrand.id == brands.elementAt(0).id)
                    .length,
                images: products
                    .where((element) =>
                        element.proBrand.id == brands.elementAt(0).id)
                    .map((e) => e.images.first.url)
                    .take(3) // Ensures a maximum of 3 product images
                    .toList(),
                onPressed: () => Get.to(
                  () => BrandProductsScreen(
                    brand: brands.elementAt(0),
                  ),
                ),
              ),
              BrandShowcase(
                productCount: products
                    .where((element) =>
                        element.proBrand.id == brands.elementAt(0).id)
                    .length,
                brandModel: brands.elementAt(1),
                images: products
                    .where((element) =>
                        element.proBrand.id == brands.elementAt(1).id)
                    .map((e) => e.images.first.url)
                    .toList(),
                onPressed: () => Get.to(
                  () => BrandProductsScreen(
                    brand: brands.elementAt(1),
                  ),
                ),
              ),
              SectionHeading(
                title: 'You might also like',
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              GridLayout(
                  itemCount: products.length < 4 ? products.length : 4,
                  itemBuilder: (_, index) {
                    return ProductCardVertical(
                      product: products[index],
                    );
                  }),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
