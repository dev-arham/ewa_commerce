import 'package:ewa_store/features/shop/controllers/data_controller.dart';
import 'package:ewa_store/features/shop/models/poster_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final List<PosterModel> promoBanners = DataController.to.allPosters;

  final _carouselSelectedIndex = 0.obs;
  int get carouselSelectedIndex => _carouselSelectedIndex.value;

  void updatePageIndicator(int index) {
    _carouselSelectedIndex.value = index;
  }
}
