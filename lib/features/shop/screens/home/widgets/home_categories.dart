import 'package:ewa_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:ewa_store/common/widgets/shimmer_box/category_shimmer.dart';
import 'package:ewa_store/features/shop/controllers/data_controller.dart';
import 'package:ewa_store/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dataController = DataController.to;
    return Obx(() {
      if (dataController.categoryLoading.value) {
        return const CategoryShimmer();
      }
      if (dataController.allCategories.isEmpty) {
        return Center(
          child: Column(
            children: [
              Text(
                'No Category Found!',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: Colors.white),
              ),
            ],
          ),
        );
      }
      return SizedBox(
        height: 80,
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: dataController.allCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = dataController.allCategories[index];
            return VerticalImageText(
              image: category.imageUrl,
              title: category.name,
              onTap: () => Get.to(
                () => SubCategoriesScreen(
                  category: category,
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
